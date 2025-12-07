import 'package:baytech/Screens/Bookings.dart';
import 'package:baytech/Screens/chat_page.dart';
import 'package:baytech/Screens/estate_page.dart';
import 'package:baytech/Screens/profil_page.dart';
import 'package:baytech/components/BottomNaviga.dart';
import 'package:baytech/components/home_screen_co.dart';
import 'package:baytech/components/notification.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = "Home_Page";
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageSelected = 0;
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const HomeScreenBild(),
      const BookingsPage(),
      const YourEstatesPage(),
      const ChatsPage(),
    ];
  }

  void _Itemchoce(int index) {
    setState(() {
      _pageSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationScreen.id);
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushNamed(ProfileInforma.id);
            },
          ),
        ],
      ),

      body: _widgetOptions.elementAt(_pageSelected),

      bottomNavigationBar: BottomNativigation(
        selectbottom: _pageSelected,
        onItemTap: _Itemchoce,
      ),
    );
  }
}
