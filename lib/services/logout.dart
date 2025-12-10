import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> Logout({
  required BuildContext context,
}) async {
  String url = KbaseUrl + "logout";
  try {
    Response response = await Api().post(url: url, token: await AuthService.getToken());
    Map<String, dynamic> body = jsonDecode(response.body);
    if (response.statusCode != 201 && response.statusCode != 200) {
      String message = body["message"];
      showDialoge(context, child: Text(message));
    } else {
        Navigator.popAndPushNamed(context, LoginPage.id);
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text("something went wrong, please check your internet connection."),
    );
  }
}
