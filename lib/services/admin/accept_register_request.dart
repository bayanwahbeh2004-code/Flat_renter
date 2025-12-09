import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> acceptUserRegisterRequset({
  required BuildContext context,
  required User regist,
  required String token,
}) async {
  String id = regist.id.toString();
  String url = KbaseUrl + "acceptedUser/" + id;
  try {
    Response response = await Api().put(url: url, token: token);
    Map<String, dynamic> body = jsonDecode(response.body);
    String message = body["message"];
    showDialoge(context, message: message);
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      message:
          "something went wrong, please double check your data and your internet connection.",
    );
  }
}
