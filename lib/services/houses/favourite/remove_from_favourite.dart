import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> removeFromFavourite({
  required BuildContext context,
  required Apartment house,
  String? token,
}) async {
  String url = "${KbaseUrl}house/${house.id}/favorite";
  try {
    Response response = await Api().del(url: url, token: token);
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text('Your account was deleted by the admin.'),
      );
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please double check your data and your internet connection.",
      ),
    );
  }
}
