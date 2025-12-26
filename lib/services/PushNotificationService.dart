import 'dart:developer';
import 'package:baytech/components/notification.dart';
import 'package:baytech/services/LocalNotificationServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Pushnotificationservices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<String?> init() async {
    await messaging.requestPermission();

    String? token = await messaging.getToken();
    print('FCM Token: $token');

    FirebaseMessaging.onBackgroundMessage(handelBackgroundMessage);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService.showBasicNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (LocalNotificationService.navigatorKey.currentContext != null) {
        Navigator.push(
          LocalNotificationService.navigatorKey.currentContext!,
          MaterialPageRoute(builder: (_) => NotificationScreen()),
        );
      }
    });
    return token;
  }

  static Future<void> handelBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
  }
}
