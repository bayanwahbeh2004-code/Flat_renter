import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/Screens/add_appartment_page.dart';
import 'package:baytech/Theme/theme.dart';
import 'package:baytech/auth.dart';
import 'package:flutter/material.dart';
import 'package:baytech/Screens/KeyinAnimation.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  final token = await AuthService.getToken();
  runApp(Baytech(token: token));
}

class Baytech extends StatelessWidget {
  Baytech({required String? token});
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
        AddAppartmentPage.id: (context) => AddAppartmentPage(),
        PersonalInfoPage.id: (context) => PersonalInfoPage(),
      },
    );
  }
}
