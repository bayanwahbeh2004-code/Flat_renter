import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/Screens/Waiting_Admin.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/admin/Admin_Welcome_Page.dart';
import 'package:baytech/admin/Admin_Login_Page.dart';
import 'package:baytech/admin/Admin_Signup_page.dart';
import 'package:baytech/Theme/theme.dart';
import 'package:flutter/material.dart';
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
      // home: AdminWelcomePage(),
      initialRoute: Dashboard.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        WaitingAdmin.id: (context) => WaitingAdmin(),
        PersonalInfoPage.id: (context) => PersonalInfoPage(),
        AdminWelcomePage.id: (context) => AdminWelcomePage(),
        AdminLoginPage.id: (context) => AdminLoginPage(),
        AdminSignupPage.id: (context) => AdminSignupPage(),
        Dashboard.id: (context) => Dashboard(),
      },
    );
  }
}
