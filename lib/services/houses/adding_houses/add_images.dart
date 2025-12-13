import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';

Future<void> addImages({
  required Apartment house,
  required List<String> images,
  required BuildContext context,
}) async {
  String url = "${KbaseUrl}storeImages/${house.id}";
  Map<String, String> files = {};
  for (int i = 0; i < images.length; i++) {
    files['houseImages[$i]'] = images[i];
  }
  try {
    var response = await Api().multiPartRequest(
      url: url,
      fields: {},
      files: files,
    );
    var responseBody = await response.stream.bytesToString();
    var body = json.decode(responseBody);
    if (response.statusCode != 201 && response.statusCode != 200) {
      if (body.containsKey('errors')) {
       dynamic message = body["errors"];
        String show = "";
        if (message is String) show = message;
        message.forEach((key, value) => show = show + value[0].toString());
        showDialoge(context, child: Text(show));
      }
    } else {
      String message = body["message"];
      showDialoge(context, child: Text(message));
    }
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        "something went wrong, please check your interntet connection",
      ),
    );
  }
}
