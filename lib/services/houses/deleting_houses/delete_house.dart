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

Future<bool> deleteHouse({
  required BuildContext context,
  required Apartment house,
}) async {
  String url = "${KbaseUrl}destroyHouse/${house.id}";

  try {
    print(house.id);
    Response response = await Api().del(
      url: url,
      token: await AuthService.getToken(),
    );
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text(
          'Your account was deleted by the admin or session was over.',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
      return false;
    } else if (response.statusCode != 201 && response.statusCode != 200) {
      showDialoge(context, child: Text("${house.id}"));
      return false;
    }

    return true;
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please double check your data and your internet connection.",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
    return false;
  }
}
