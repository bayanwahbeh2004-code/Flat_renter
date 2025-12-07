import 'package:baytech/Screens/Bookings.dart';
import 'package:baytech/Screens/HomeApp.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/Screens/Waiting_Admin.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/Screens/chat_page.dart';
import 'package:baytech/Screens/estate_page.dart';
import 'package:baytech/Screens/profil_page.dart';
//import 'package:baytech/Screens/profile_page.dart';
import 'package:baytech/Theme/theme.dart';
import 'package:baytech/components/notification.dart';
import 'package:flutter/material.dart';
import 'package:baytech/Screens/KeyinAnimation.dart';
import 'admin/Dashboard.dart';

void main() {
  runApp(Baytech());
}

class Baytech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Baytech",
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      initialRoute: HomeScreen.id,
      routes: {
        KeyinAnimation.id: (context) => const KeyinAnimation(),
        WelcomePage.id: (context) => const WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        WaitingAdmin.id: (context) => WaitingAdmin(),
        PersonalInfoPage.id: (context) => PersonalInfoPage(),
        HomeScreen.id: (context) => HomeScreen(),
        NotificationScreen.id: (context) => const NotificationScreen(),

        BookingsPage.id: (context) => const BookingsPage(),
        ChatsPage.id: (context) => const ChatsPage(),
        YourEstatesPage.id: (context) => const YourEstatesPage(),
        ProfileInforma.id: (context) => const ProfileInforma(),
      },
    );
  }
}
