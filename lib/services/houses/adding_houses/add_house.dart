import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';

Future<Apartment> addHouse({
  required Apartment house,
  required BuildContext context,
}) async {
  String url = "${KbaseUrl}storeHouse";
  try {
    var response = await Api().multiPartRequest(
      method: 'POST',
      token: await AuthService.getToken(),
      url: url,
      fields: {
        "governorate": house.governorate ?? '',
        "city": house.city ?? '',
        "category": house.category ?? '',
        "title": house.title ?? '',
        "bedrooms": house.bedrooms ?? '',
        "bathrooms": house.bathrooms ?? '',
        "livingrooms": house.livingRooms ?? '',
        "area": house.area ?? '',
        "day_price": house.price ?? '',
        "descreption": house.description ?? '',
      },
      files: {"mainImage": house.mainImage ?? ''},
    );
    var responseBody = await response.stream.bytesToString();
    var body = json.decode(responseBody);
    if (response.statusCode == 401) {
      Navigator.popAndPushNamed(context, WelcomePage.id);
      showDialoge(
        context,
        child: Text(
          S.of(context).sess_error,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    }
    if (response.statusCode != 201 && response.statusCode != 200) {
      if (body.containsKey('errors')) {
        dynamic message = body["errors"];
        String show = "";
        if (message is String) {
          show = message;
        } else {
          message.forEach((key, value) => show = show + value[0].toString());
        }
        showDialoge(context, child: Text(show));
      }
      return Apartment();
    } else {
      return Apartment.fromJson(body['data']['House']);
    }
  } catch (e) {
    showDialoge(
      context,
      child: Text(
        S.of(context).err_connection,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
    return Apartment();
  }
}
