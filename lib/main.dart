import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/Screens/add_appartment_page.dart';
import 'package:baytech/Screens/edit_apartment_page.dart';
import 'package:baytech/Screens/home_page.dart';
import 'package:baytech/Theme/theme.dart';
import 'package:baytech/admin/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:baytech/Screens/KeyinAnimation.dart';

void main() {
  runApp(Baytech());
}

class Baytech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      initialRoute: AddAppartmentPage.id,
      routes: {
        KeyinAnimation.id: (context) => KeyinAnimation(),
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        WaitingPage.id: (context) => WaitingPage(),
        PersonalInfoPage.id: (context) => PersonalInfoPage(),
        AddAppartmentPage.id: (context) => AddAppartmentPage(),
        //editAppartmentPage.id: (context) => editAppartmentPage(),
        HomePage.id: (context) => HomePage(),
        Dashboard.id: (context) => Dashboard(),
      },
    );
  }
}
