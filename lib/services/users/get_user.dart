import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<User> getUser({required BuildContext context}) async {
  String url = KbaseUrl + "getUserForActive";
  print(url);
  try {
    print(await AuthService.getToken());
    Response data = await Api().get(
      url: url,
      token: await AuthService.getToken(),
    );
    if (data.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text(
          S.of(context).account_deleted_admin,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
      return User();
    } else {
      Map<String, dynamic> user = jsonDecode(data.body)['User'];
      return User(
        id: user['id'],
        firstName: user['first_name'],
        secondName: user['last_name'],
        phoneNumber: user['phone'],
        birthday: user['date_of_birth'],
        indentityCardPath: user['Personal_identity_photo'],
        profilePicturePath: user['personal_photo'],
        password: user['password'],
        role: user['role'],
        active: user['active'],
        account: user['account'],
      );
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        S.of(context).error_in,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
    return User();
  }
}
