import 'package:baytech/Models/User.dart';
import 'package:baytech/Screens/Bookings.dart';
import 'package:baytech/Screens/etate_page/estate_page.dart';
import 'package:baytech/Screens/home_page/home_content.dart';
import 'package:baytech/Screens/profil_page.dart';
import 'package:baytech/components/BottomNaviga.dart';
import 'package:baytech/components/notification.dart';
import 'package:baytech/services/users/get_user.dart';
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
      HomeContent(),
      BookingsPage(),
      YourEstatesPage(),
      //ChatPage(),
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(NotificationScreen.id);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () async {
              User user = await getUser(context: context);
              if (user.firstName != null) {
                Navigator.of(
                  context,
                ).pushNamed(ProfileInforma.id, arguments: user);
              }
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
