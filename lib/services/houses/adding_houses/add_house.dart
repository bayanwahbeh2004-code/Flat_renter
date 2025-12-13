import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
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
      url: url,
      fields: {
        "governorate": house.location!.governorate,
        "city": house.location!.city,
        "category": house.category,
        "title": house.title,
        "bedrooms": house.bedrooms,
        "bathrooms": house.bathrooms,
        "livingrooms": house.livingRooms,
        "area": house.area,
        "day_price": house.price,
        "descreption": house.description,
      },
      files: {"mainImage": house.mainImage!},
    );
    var responseBody = await response.stream.bytesToString();
    var body = json.decode(responseBody);
    if (response.statusCode != 201 && response.statusCode != 200) {
      if (body.containsKey('errors')) {
        Map<String, dynamic> message = body["errors"];
        String show = "";
        message.forEach((key, value) => show = show + value[0].toString());
        showDialoge(context, child: Text(show));
      }
      return Apartment();
    } else {
      String message = body["message"];
      showDialoge(context, child: Text(message));
      return Apartment.fromJson(body);
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your interntet connection",
      ),
    );
    return Apartment();
  }
}
