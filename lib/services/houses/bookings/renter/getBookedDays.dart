import 'dart:convert';
import 'dart:ui';

import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/helper/Api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:table_calendar/table_calendar.dart';

Future<List<DateTime>?> getBookedDays({
  required BuildContext context,
  required Apartment house,
}) async {
  String url = "${KbaseUrl}getBookForHouse/${house.id}";
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
      return null;
    } else if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      List<DateTime> days = [];
      if (data.isNotEmpty) {
        for (var key in data) {
          DateTime startDate = DateTime.parse(key['Book']['start_date']);
          DateTime endDate = DateTime.parse(key['Book']['end_date']);
          DateTime current = startDate;
          while (current.isBefore(endDate) || isSameDay(current, endDate)) {
            days.add(DateTime.utc(current.year, current.month, current.day));
            current = current.add(const Duration(days: 1));
          }
        }
      }
      return days;
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
  }
  return null;
}
