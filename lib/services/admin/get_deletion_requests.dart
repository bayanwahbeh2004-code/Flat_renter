import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/services/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<List<dynamic>> getDeletionRequests({
  required BuildContext context,
  required String token,
}) async {
  String url = KbaseUrl + "getDeleteRequests";
  try {
    Map<String, dynamic> data = await Api().get(url: url, token: token);
    return data["data"];
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      message: "something went wrong, please check your internet connection.",
    );
    return [];
  }
}
