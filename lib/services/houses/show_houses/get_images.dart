import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<List<String>> getImages({
  required BuildContext context,
  required Apartment house,
}) async {
  String url = "${KbaseUrl}getImages/${house.id}";
  try {
    Response response = await Api().get(
      url: url,
      token: await AuthService.getToken(),
    );
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text(
          'Your account was deleted by the admin or session was over.',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
      return [];
    } else {
      List<dynamic> data = jsonDecode(response.body)['data'] ?? [];
      List<String> images = [];
      data.forEach((item) => images.add(item['Image']['houseImages']));
      return images;
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your internet connection.",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
    return [];
  }
}
