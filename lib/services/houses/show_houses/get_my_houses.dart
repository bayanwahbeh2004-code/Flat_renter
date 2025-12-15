import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<List<Apartment>> getHousesForOwner({
  required BuildContext context,
}) async {
  String url = "${KbaseUrl}getHousesForOwner";
  try {
    Response response = await Api().get(
      url: url,
      token: await AuthService.getToken(),
    );
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text("Your account was deleted by the admin"),
      );
      return [];
    } else if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      List<Apartment> houses = [];
      data.forEach((item) => houses.add(Apartment.fromJson(item['House'])));
      return houses;
    } else {
      print("status code is: ${response.statusCode}");
      return [];
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
