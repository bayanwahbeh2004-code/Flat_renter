import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Filter.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<List<Apartment>> Filtering({
  required Filter filter,
  required BuildContext context,
}) async {
  String url =
      "${KbaseUrl}getHouses?" +
      "title_search=${filter.title}" +
      "&city_search=${filter.city}" +
      "&governorate_search=${filter.governorate}" +
      "&category_search=${filter.category}" +
      "&min_price=${filter.minPrice}" +
      "&max_price=${filter.maxPrice}" +
      "&min_area=${filter.minarea}" +
      "&max_area=${filter.maxarea}" +
      "&min_bedrooms=${filter.minBedroom}" +
      "&max_bedrooms=${filter.maxBedroom}" +
      "&min_bathrooms=${filter.minBathroom}" +
      "&max_bathrooms=${filter.maxBathroom}" +
      "&min_livingrooms=${filter.minLivingRoom}" +
      "&max_livingrooms=${filter.maxLivingRoom}" +
      "&search=${filter.description}";
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
    } else {
      List<dynamic> data = jsonDecode(response.body)['data'];
      List<Apartment> houses = [];
      data.forEach((item) => houses.add(Apartment.fromJson(item['House'])));
      return houses;
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
