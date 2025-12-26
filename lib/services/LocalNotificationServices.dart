import 'dart:async';
import 'package:baytech/components/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static StreamController<NotificationResponse> streamController =
      StreamController();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static onTap(NotificationResponse notificationResponse) {
    streamController.add(notificationResponse);

    if (navigatorKey.currentContext != null) {
      Navigator.push(
        navigatorKey.currentContext!,
        MaterialPageRoute(builder: (_) => NotificationScreen()),
      );
    }
  }

  static Future init() async {
  const InitializationSettings settings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    iOS: DarwinInitializationSettings(),
  );

  await flutterLocalNotificationsPlugin.initialize(
    settings,
    onDidReceiveNotificationResponse: onTap,
    onDidReceiveBackgroundNotificationResponse: onTap,
  );

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'channel_id',           
    'channel_name',        
    description: 'Main notifications channel',
    importance: Importance.max,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}


  static void showBasicNotification(RemoteMessage message) async {
    AndroidNotificationDetails android = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      icon: '@mipmap/ic_launcher'
    );

    NotificationDetails details = NotificationDetails(android: android);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      details,
    );
  }
}
