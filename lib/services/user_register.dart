import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/Screens/Waiting_Admin.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> UserRegister({
  required RegisterRequest data,
  required BuildContext context,
  required String confirmPassword,
}) async {
  String url = KbaseUrl + "register";

  Map<String, dynamic> fields = {
    "first_name": data.firstName,
    "last_name": data.secondName,
    "date_of_birth": data.birthday,
    "password": data.account!.password!,
    "password_confirmation": confirmPassword,
    "phone": data.account!.phoneNumber!,
  };
  Map<String, dynamic> files = {
    "Personal_identity_photo": data.indentityCard.path,
    "personal_photo": data.profilePicture.path,
  };
  try {
    http.StreamedResponse response = await Api().multiPartRequest(
      context: context,
      url: url,
      fields: fields,
      files: files,
    );
    var responseBody = await response.stream.bytesToString();
    var body = json.decode(responseBody);
    if (response.statusCode != 201) {
      if (body.containsKey('message')) {
        Map<String, dynamic> message = body["errors"];
        String show = "";
        message.forEach((key, value) => show = show+value[0].toString());
        showDialoge(context, message: show);
      }
      else
        Navigator.popAndPushNamed(context, WaitingAdmin.id);
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      message: "something went wrong, please check your internet connection",
    );
  }
}
