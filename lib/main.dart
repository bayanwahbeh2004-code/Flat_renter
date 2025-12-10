import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/Screens/add_appartment_page.dart';
import 'package:baytech/admin/Admin_Welcome_Page.dart';
import 'package:baytech/admin/Admin_Login_Page.dart';
import 'package:baytech/admin/Admin_Signup_page.dart';
import 'package:baytech/Theme/theme.dart';
import 'package:baytech/admin/Dashboard.dart';
import 'package:baytech/components/apartmentPicture.dart';
import 'package:baytech/components/appartmentImage.dart';
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
      home: Scaffold(body: Apartmentpicture(height: 120,width: 120),),
    //   theme: lightMode,
    //   initialRoute: AddAppartmentPage.id,
    //   routes: {
    //     KeyinAnimation.id: (context) => KeyinAnimation(),
    //     WelcomePage.id: (context) => WelcomePage(),
    //     LoginPage.id: (context) => LoginPage(),
    //     SignupPage.id: (context) => SignupPage(),
    //     WaitingPage.id: (context) => WaitingPage(),
    //     AddAppartmentPage.id: (context) => AddAppartmentPage(),
    //     PersonalInfoPage.id: (context) => PersonalInfoPage(),
    //     AdminWelcomePage.id: (context) => AdminWelcomePage(),
    //     AdminLoginPage.id: (context) => AdminLoginPage(),
    //     AdminSignupPage.id: (context) => AdminSignupPage(),
    //     Dashboard.id: (context) => Dashboard(),
    //   },
    );
  }
}
