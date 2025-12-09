import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<User> getUser({
  required BuildContext context,
  required String token,
  required int id,
}) async {
  String url = KbaseUrl + "getUser/" + id.toString();
  try {
    Map<String, dynamic> data = await Api().get(url: url, token: token);
    return User.fromjson(data);
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      message: "something went wrong, please check your internet connection.",
    );
    return User();
  }
}
