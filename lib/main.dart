import 'package:baytech/Screens/Bookings.dart';
import 'package:baytech/Screens/HomeApp.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/Screens/add_appartment_page.dart';
import 'package:baytech/Screens/chat_page.dart';
import 'package:baytech/Screens/estate_page.dart';
import 'package:baytech/Screens/profil_page.dart';
import 'package:baytech/Screens/view_appartment.dart';
import 'package:baytech/Theme/theme.dart';
import 'package:baytech/Theme/theme_proider.dart';
import 'package:baytech/components/notification.dart';
import 'package:flutter/material.dart';
import 'package:baytech/Screens/KeyinAnimation.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Baytech(),
    ),
  );
}

class Baytech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context, listen: false).themeData,
      initialRoute: ApartmentDetailsPage.id,
      routes: {
        ApartmentDetailsPage.id: (context) => ApartmentDetailsPage(),
        KeyinAnimation.id: (context) => const KeyinAnimation(),
        WelcomePage.id: (context) => const WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        WaitingPage.id: (context) => WaitingPage(),
        AddAppartmentPage.id: (context) => AddAppartmentPage(),
        PersonalInfoPage.id: (context) => PersonalInfoPage(),
        HomeScreen.id: (context) => HomeScreen(),
        NotificationScreen.id: (context) => const NotificationScreen(),
        BookingsPage.id: (context) => const BookingsPage(),
        ChatsPage.id: (context) => const ChatsPage(),
        YourEstatesPage.id: (context) => const YourEstatesPage(),
        ProfileInforma.id: (context) => ProfileInforma(),
      },
    );
  }
}
