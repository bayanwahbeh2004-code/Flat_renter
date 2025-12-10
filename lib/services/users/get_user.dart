import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<User> getUser({required BuildContext context}) async {
  String url = KbaseUrl + "getUserForActive";
  print(url);
  try {
    print(await AuthService.getToken());
    Map<String, dynamic> data = await Api().get(
      url: url,
      token: await AuthService.getToken(),
    );
    return User(
      id: data['id'],
      firstName: data['first_name'],
      secondName: data['last_name'],
      phoneNumber: data['phone'],
      birthday: data['date_of_birth'],
      indentityCardPath: data['Personal_identity_photo'],
      profilePicturePath: data['personal_photo'],
      password: data['password'],
      role: data['role'],
      active: data['active'],
      account: data['account'],
    );
    ;
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text("something went wrong, please check your internet connection."),
    );
    return User();
  }
}
