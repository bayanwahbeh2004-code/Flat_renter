import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
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
      home: WelcomePage(),
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
      },
    );
  }
}
