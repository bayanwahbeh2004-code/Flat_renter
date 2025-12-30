import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Future<void> removeFromFavourite({
  required BuildContext context,
  required Apartment house,
}) async {
  String url = "${KbaseUrl}house/${house.id}/favorite";
  try {
    Response response = await Api().del(
      url: url,
      token: await AuthService.getToken(),
    );
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
  } catch (e) {
    print(e.toString());
    showDialoge(
      context,
      child: Text(
        S.of(context).err_connection,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
