import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Account.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/admin/Dashboard.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> UserLogin({
  required Account account,
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
      print("this is log in");
      String message = body["message"];
      showDialoge(context, message: message);
    } else {
      if (body["User"]["role"] == "user") {
        Account account = Account.fromjson(body);
        Navigator.popAndPushNamed(context, WaitingPage.id, arguments: account);
      } else {
        Account account = Account.fromjson(body);
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
