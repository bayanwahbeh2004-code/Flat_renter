import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<List<String>> getCitesForGovernorate({
  required BuildContext context,
  required String governorate,
}) async {
  String url = "${KbaseUrl}getCitesForGovernorate?governorate=$governorate";
  try {
    Response response = await Api().get(
      url: url,
      token: await AuthService.getToken(),
    );
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text('Your account was deleted by the admin.'),
      );
      return [];
    } else {
      List<dynamic> data = jsonDecode(response.body);
      List<String> cities = [];
      data.forEach((key) => cities.add(key['city']));
      return cities;
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your internet connection.",
      ),
    );
    return [];
  }
}
