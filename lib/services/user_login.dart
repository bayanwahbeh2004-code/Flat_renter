import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Account.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> UserLogin({
  required Account account,
  required BuildContext context,
}) async {
  String url = KbaseUrl + "login";
  try {
    Response response = await Api().post(
      url: url,
      body: {"phoneNumber": account.phoneNumber, "password": account.password},
    );
    var meesage = jsonDecode(response.body);
    showSnackBar(context: context, message: meesage["message"]);
    //to  home page
    //Navigator.popAndPushNamed(context, HomePage.id);
  } catch (e) {
    showSnackBar(context: context, message: "something went wrong");
  }
}
