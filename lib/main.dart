import 'package:baytech/Screens/Bookings.dart';
import 'package:baytech/Screens/FilteringPage.dart';
import 'package:baytech/Screens/edit_apartment_page.dart';
import 'package:baytech/Screens/home_page/home_app.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/Screens/Welcome_Page.dart';
import 'package:baytech/Screens/add_appartment_page.dart';
import 'package:baytech/Screens/chat_page.dart';
import 'package:baytech/Screens/etate_page/estate_page.dart';
import 'package:baytech/Screens/profil_page.dart';
import 'package:baytech/Screens/viewAppartment.dart';
import 'package:baytech/Theme/theme_proider.dart';
import 'package:baytech/Screens/calendar_booking_page.dart';
import 'package:baytech/components/notification.dart';
import 'package:baytech/providers/Filter_provider.dart';
import 'package:baytech/providers/cities_provider.dart';
import 'package:baytech/providers/favourites_provider.dart';
import 'package:baytech/providers/my_houses_provider.dart';
import 'package:flutter/material.dart';
import 'package:baytech/Screens/KeyinAnimation.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FilterProvider(), lazy: false),
        ChangeNotifierProvider(
          create: (_) => FavouritesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => MyHousesProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => CitiesProvider()),
      ],
      child: Baytech(),
    ),
  );
}

class Baytech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: HomeScreen.id,
      routes: {
        KeyinAnimation.id: (context) => const KeyinAnimation(),
        WelcomePage.id: (context) => const WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        SignupPage.id: (context) => SignupPage(),
        WaitingPage.id: (context) => WaitingPage(),
        AddAppartmentPage.id: (context) => AddAppartmentPage(),
        EditApartmentPage.id: (context) => EditApartmentPage(),
        PersonalInfoPage.id: (context) => PersonalInfoPage(),
        HomeScreen.id: (context) => HomeScreen(),
        NotificationScreen.id: (context) => NotificationScreen(),
        BookingsPage.id: (context) => BookingsPage(),
        ChatsPage.id: (context) => ChatsPage(),
        YourEstatesPage.id: (context) => YourEstatesPage(),
        ProfileInforma.id: (context) => ProfileInforma(),
        Filteringpage.id: (context) => Filteringpage(),
        ApartmentDetailsPage.id: (context) => ApartmentDetailsPage(),
        calendar_book.id: (context) => calendar_book(),
      },
    );
  }
}
