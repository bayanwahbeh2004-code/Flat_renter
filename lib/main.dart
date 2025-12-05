import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/Screens/Waiting_Admin.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/Theme/theme.dart';
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
      initialRoute: PersonalInfoPage.id,
      routes: {
        KeyinAnimation.id: (context) => KeyinAnimation(),
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        WaitingAdmin.id: (context) => WaitingAdmin(),
        PersonalInfoPage.id: (context) => PersonalInfoPage(),
      },
    );
  }
}
