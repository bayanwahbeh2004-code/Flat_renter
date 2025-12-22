import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/Screens/home_page/home_app.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/services/users/get_user.dart';
import 'package:baytech/services/users/user_active.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:baytech/auth.dart';

Future<void> Login({
  required User account,
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
      String message = body["message"];
      showDialoge(
        context,
        child: Text(
          message,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    } else {
      AuthService.saveToken(body['Token']);
      print(body['Token']);
      bool active = await userStatus(context: context);
      if ((await getUser(context: context)).role == 'admin') {
        showDialoge(
          context,
          child: Text(
            "this is admin account, create a user account please.",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        );
        return;
      }

      if (active)
        Navigator.popAndPushNamed(context, HomeScreen.id);
      else
        Navigator.popAndPushNamed(context, WaitingPage.id);
    }
  } catch (e) {
    print(e.toString());
    print('this is log in');
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your internet connection.",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
