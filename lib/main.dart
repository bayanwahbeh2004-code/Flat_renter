import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/Screens/Waiting_Admin.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/Theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Baytech());
}

class Baytech extends StatelessWidget {
  const Baytech({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        WaitingAdmin.id: (context) => WaitingAdmin(),
      },
    );
  }
}
