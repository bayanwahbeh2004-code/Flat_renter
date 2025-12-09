import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/services/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> UserRegister({
  required User data,
  required BuildContext context,
  required String confirmPassword,
}) async {
  String url = KbaseUrl + "register";
  try {
    var response = await Api().multiPartRequest(
      url: url,
      fields: {
        "first_name": data.firstName,
        "last_name": data.secondName,
        "date_of_birth": data.birthday,
        "password": data.password,
        "password_confirmation": confirmPassword,
        "phone": data.phoneNumber,
      },
      files: {
        "Personal_identity_photo": data.indentityCard,
        "personal_photo": data.profilePicture,
      },
    );
    var responseBody = await response.stream.bytesToString();
    var body = json.decode(responseBody);
    if (response.statusCode != 201 && response.statusCode != 200) {
      if (body.containsKey('errors')) {
        Map<String, dynamic> message = body["errors"];
        String show = "";
        message.forEach((key, value) => show = show + value[0].toString());
        showDialoge(context, message: show);
      }
    } else
      Login(account: data, context: context);
  } catch (e) {
    print(e.toString());
    showDialoge(context, message: "something went wrong");
  }
}
