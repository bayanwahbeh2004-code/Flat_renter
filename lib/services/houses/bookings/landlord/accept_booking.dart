import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/book.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> acceptBooking({
  required BuildContext context,
  required Book book,
}) async {
  String url = "${KbaseUrl}acceptedeBooking/${book.id}";
  try {
    Response response = await Api().put(
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
    } else if (response.statusCode != 200) {
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
    } else {
      showDialoge(
        context,
        child: Text(
          "Request was successfully accepted.",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please double check your data and your internet connection.",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
