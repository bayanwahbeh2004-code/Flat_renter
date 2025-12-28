import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<bool> updateHouse({
  required BuildContext context,
  required Apartment old_house,
  required Apartment house,
  required String mainImage,
  required String id,
}) async {
  String url = "${KbaseUrl}updateHouse/$id";
  try {
    var response = await Api().multiPartRequest(
      token: await AuthService.getToken(),
      url: url,
      fields: {
        "_method": 'PUT',
        "governorate": house.governorate ?? old_house.governorate,
        "city": house.city ?? old_house.city,
        "category": house.category ?? old_house.category,
        "title": house.title ?? old_house.title,
        "bedrooms": house.bedrooms ?? old_house.bedrooms,
        "bathrooms": house.bathrooms ?? old_house.bathrooms,
        "livingrooms": house.livingRooms ?? old_house.bathrooms,
        "area": house.area ?? old_house.area,
        "day_price": house.price ?? old_house.price,
        "descreption": house.description ?? old_house.description,
      },
      files: {"mainImage": mainImage},
    );
    var responseBody = await response.stream.bytesToString();
    var body = json.decode(responseBody);
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text(
          'Your account was deleted by the admin or session was over.',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }
    print(response.statusCode);
    if (response.statusCode != 200) {
      if (body.containsKey("errors")) {
        dynamic message = body["errors"];
        String show = "";
        if (message is String)
          show = message;
        else
          message.forEach((key, value) => show = show + value[0].toString());
        showDialoge(
          context,
          child: Text(
            show,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        );
      }
      return false;
    } else {
      return true;
    }
  } catch (e) {
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your interntet connection.",
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
    return true;
  }
}
