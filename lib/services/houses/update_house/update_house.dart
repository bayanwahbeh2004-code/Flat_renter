import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<Apartment> updateHouse({
  required BuildContext context,
  required Apartment house,
}) async {
  String url = "${KbaseUrl}updateHouse/$house.id";
  try {
    Response response = await Api().post(
      url: url,
      token: await AuthService.getToken(),
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text('Your account was deleted by the admin.'),
      );
      return Apartment();
    } else if (response.statusCode != 201 && response.statusCode != 200) {
      if (data.containsKey("errors")) {
        Map<String, dynamic> message = data["errors"];
        String show = "";
        message.forEach((key, value) => show = show + value[0].toString());
        showDialoge(context, child: Text(show));
      }
      return Apartment();
    } else {
      return Apartment.fromJson(data['data']['House']);
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your internet connection.",
      ),
    );
    return Apartment();
  }
}
