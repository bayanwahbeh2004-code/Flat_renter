import 'dart:convert';

import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> UserRegister({
  required Map<dynamic, dynamic> data,
  required BuildContext context,
  required String password,
  required String confirmPassword,
}) async {
  String url = KbaseUrl + "register";
  try {
    Response response = await Api().post(
      url: url,
      body: {
        "first_name": data["firstName"],
        "last_name": data["secondName"],
        "date_of_birth": data["birthdate"].toString(),
        "Personal_identity_photo": data["identityCard"],
        "personal_photo": data["profilePicture"],
        "phoneNumber": phoneNumber,
        "password": password,
        "confirmPassword": confirmPassword,
      },
    );
    var meesage = jsonDecode(response.body);
    showSnackBar(context, meesage["message"]);
    Navigator.popAndPushNamed(context, LoginPage.id);
  } catch (e) {
    showSnackBar(context, "something went wrong");
  }
}
