import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';

Future<bool> addImages({
  required Apartment house,
  required List<String> images,
  required BuildContext context,
}) async {
  String url = "${KbaseUrl}storeImages/${house.id}";
  try {
    Map<String, String> files = {};
    for (int i = 0; i < images.length; i++) {
      files['houseImages[$i]'] = images[i];
    }
    var response = await Api().multiPartRequest(
      method: 'POST',
      token: await AuthService.getToken(),
      url: url,
      fields: {},
      files: files,
    );
    var responseBody = await response.stream.bytesToString();
    var body = json.decode(responseBody);
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
    }
    if (response.statusCode != 201) {
      if (body.containsKey('errors')) {
        dynamic message = body["errors"];
        String show = "";
        if (message is String)
          show = message;
        else {
          message.forEach((key, value) => show = show + value[0].toString());
        }
        showDialoge(context, child: Text(show));
      }
      return false;
    } else {
      return true;
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your interntet connection.",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
    return false;
  }
}
