import 'dart:convert';
import 'package:baytech/Constants.dart';

import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/admin/Dashboard.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> Login({
  required Register account,
  required BuildContext context,
}) async {
  String url = KbaseUrl + "login";
  try {
    Response response = await Api().post(
      url: url,
      body: {"phone": account.phoneNumber, "password": account.password},
    );
    Map<String, dynamic> body = jsonDecode(response.body);
    if (response.statusCode != 201 && response.statusCode != 200) {
      String message = body["message"];
      showDialoge(context, message: message);
    } else {
      if (body["User"]["role"] == "user") {
        Register account = Register.fromjson(body);
        account.token = body['Token'];
        Navigator.popAndPushNamed(context, WaitingPage.id, arguments: account);
      } else {
        Register account = Register.fromjson(body);
        account.token = body['Token'];
        print(account.token);
        Navigator.popAndPushNamed(context, Dashboard.id, arguments: account);
      }
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      message: "something went wrong, please check your internet connection.",
    );
  }
}
