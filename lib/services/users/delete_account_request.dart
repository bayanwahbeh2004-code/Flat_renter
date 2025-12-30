import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/generated/l10n.dart';
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
        child: Text(
          S.of(context).account_deleted_admin,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
      Navigator.popAndPushNamed(context, WelcomePage.id);
      return;
    }
    Map<String, dynamic> body = jsonDecode(response.body);
    String message = body["message"];
    showDialoge(
      context,
      child: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        S.of(context).err_generic,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
