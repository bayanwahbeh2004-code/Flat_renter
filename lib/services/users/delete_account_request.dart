import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> deleteRequest({required BuildContext context}) async {
  String url = KbaseUrl + "requestDelete";
  try {
    Response response = await Api().put(
      url: url,
      token: await AuthService.getToken(),
    );
    if (response.statusCode == 403) {
      showDialoge(
        context,
        child: Text("Your account was deleted by the admin"),
      );
      Navigator.popAndPushNamed(context, WelcomePage.id);
      return;
    }
    Map<String, dynamic> body = jsonDecode(response.body);
    String message = body["message"];
    print(await AuthService.getToken());
    //  Navigator.popAndPushNamed(context, KeyinAnimation.id);
    showDialoge(context, child: Text(message));
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please double check your data and your internet connection.",
      ),
    );
  }
}
