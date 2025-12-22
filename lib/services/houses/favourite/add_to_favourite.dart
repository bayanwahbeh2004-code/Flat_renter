import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> addToFavourites({
  required BuildContext context,
  required Apartment house,
}) async {
  String url = "${KbaseUrl}house/${house.id}/favorite";
  try {
    Response response = await Api().post(
      url: url,
      token: await AuthService.getToken(),
    );
    Map<String, dynamic> body = jsonDecode(response.body);
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text(
          'Your account was deleted by the admin or session was over.',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }
    if (response.statusCode != 201 && response.statusCode != 200) {
      if (body.containsKey("errors")) {
        dynamic message = body["errors"];
        String show = "";
        if (message is String)
          show = message;
        else
          message.forEach((key, value) => show = show + value[0].toString());
        showDialoge(
          context,
          child: Text(
            show,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        );
      }
      return;
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your internet connection.",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
