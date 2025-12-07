import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> addBalance({
  required BuildContext context,
  required String phoneNumber,
  required String balance,
  required String token,
}) async {
  String url =
      KbaseUrl + "addToAccount?phone={$phoneNumber}&account={$balance}";
  try {
    Response response = await Api().put(
      url: url,
      body: {"phone": phoneNumber, "account": balance},
      token: token,
    );
    Map<String, dynamic> body = jsonDecode(response.body);
    if(response.statusCode==422){
       String message = body["message"];
      showDialoge(context, message: message);
    }
    else if (response.statusCode == 404) {
      String message = body["Error"];
      showDialoge(context, message: message);
    } else {
      Navigator.pop(context);
      print(token);
      showDialoge(
        context,
        message:
            "$balance was successfully added to the account with phone number $phoneNumber",
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
