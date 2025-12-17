import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<bool> isfavourite({
  required BuildContext context,
  required String id,
}) async {
  String url = "${KbaseUrl}isFavoriteHouseByUser/$id";
  try {
    Response data = await Api().get(
      url: url,
      token: await AuthService.getToken(),
    );
    if (data.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text(
          'Your account was deleted by the admin or session was over.',
        ),
      );
      return false;
    } else {
      if (data.body == '1') {
        return true;
      } else {
        return false;
      }
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your internet connection.",
      ),
    );
    return false;
  }
}
