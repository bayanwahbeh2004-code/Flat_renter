import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> addBalance({
  required BuildContext context,
  required Register regist,
  required String token,
}) async {
  
  String url = KbaseUrl + "rejectionDeleteUser/{${regist.id}}";
  try {
    Response response = await Api().put(
      url: url,
      token: token,
    );
    Map<String, dynamic> body = jsonDecode(response.body);
    String message = body["message"];
    if (response.statusCode == 422) {
      showDialoge(context, message: message);
    } else if (response.statusCode == 404) {
      String message = body["Error"];
      showDialoge(context, message: message);
    } else {
      Navigator.pop(context);
      print(token);
      showDialoge(
        context,
        message: message,
      );
    }
  } catch (e) {
    print(e.toString());
    print(token);
    showDialoge(
      context,
      message:
          "something went wrong, please double check your data and your internet connection.",
    );
  }
}
