import 'dart:convert';

import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> deleteHouse({
  required BuildContext context,
  required Apartment house,
  String? token,
}) async {
  String url = "${KbaseUrl}destroyHouse/${house.id}";
  try {
    Response response = await Api().del(url: url, token: token);
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text('Your account was deleted by the admin.'),
      );
    } else if (response.statusCode != 201 && response.statusCode != 200) {
      dynamic body = jsonDecode(response.body);
      Map<String, dynamic> message = body["errors"];
      String show = "";
      message.forEach((key, value) => show = show + value[0].toString());
      showDialoge(context, child: Text(show));
    } else {
      String message = jsonDecode(response.body)['message'];
      showDialoge(context, child: Text(message));
    }
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
