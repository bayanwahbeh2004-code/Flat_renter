import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Account.dart';
import 'package:baytech/Screens/home_page.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> AdminRegister({
  required String firt_name,
  required String last_name,
  required String passwordConfirm,
  required Account account,
  required BuildContext context,
}) async {
  String url = KbaseUrl + "login";
  try {
    Response response = await Api().post(
      url: url,
      body: {
        "first_name": firt_name,
        "last_name": last_name,
        "password_confirmation": passwordConfirm,
        "phone": account.phoneNumber,
        "password": account.password,
      },
    );
    Map<String, dynamic> body = jsonDecode(response.body);
    if (response.statusCode != 201) {
      String message = body["message"];
      showDialoge(context, message: message);
    } else {
      Navigator.popAndPushNamed(context, HomePage.id);
    }
  } catch (e) {
    print(e.toString());
    showDialoge(context, message: "something went wrong");
  }
}
