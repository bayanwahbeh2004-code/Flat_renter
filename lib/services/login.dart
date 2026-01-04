import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/Screens/home_page/home_app.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/services/PushNotificationService.dart';
import 'package:baytech/services/auth_service.dart';
import 'package:baytech/services/users/get_user.dart';
import 'package:baytech/services/users/user_active.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:baytech/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> Login({
  required User account,
  required BuildContext context,
}) async {
  String url = KbaseUrl + "login";
  String? fcm_token = await Pushnotificationservices.init();
  try {
    Response response = await Api().post(
      url: url,
      body: {
        "phone": account.phoneNumber ?? '',
        "password": account.password ?? '',
        "fcm_token": fcm_token ?? '',
      },
    );
    Map<String, dynamic> body = jsonDecode(response.body);
    if (response.statusCode != 201 && response.statusCode != 200) {
      String message = body["message"];
      showDialoge(
        context,
        child: Text(
          message,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
    } else {
      User user = User.fromjson(body['User']);
      AuthService.saveToken(body['Token']);
      print(body['Token']);
      bool active = await userStatus(context: context);
      if (user.role == 'admin') {
        showDialoge(
          context,
          child: Text(
            S.of(context).admin_error,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        );
      }
      await AuthServiceFirebase().autoCreateFirebaseAccount(
        laravelUserId: user.id!,
        name: "${user.firstName} ${user.secondName}",
        profilePicture: user.profilePicturePath ?? '',
        phoneNumber: user.phoneNumber!,
      );
      if (active)
        Navigator.popAndPushNamed(context, HomeScreen.id);
      else
        Navigator.popAndPushNamed(context, WaitingPage.id);
    }
  } catch (e) {
    print(e.toString());
    print('this is log in');
    showDialoge(
      context,
      child: Text(
        S.of(context).err_connection,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
