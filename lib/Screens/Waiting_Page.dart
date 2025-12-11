import 'dart:async';
import 'package:baytech/Screens/HomeApp.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/services/users/user_active.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaitingPage extends StatefulWidget {
  static String id = "Waiting page";

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  Widget build(BuildContext context) {
    Timer? _timer;
    @override
    Future<void> _checkStatus() async {
      try {
        bool isActive = await userStatus(context: context);
        print(isActive);
        if (isActive) {
          _timer?.cancel();
          Navigator.popAndPushNamed(context, HomeScreen.id);
        }
      } catch (e) {
        print('Error checking status: $e');
      }
    }

    void _startPolling() {
      _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
        _checkStatus();
      });
    }

    void initState() {
      super.initState();
      _startPolling();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: 80),
          Center(
            child: Text(
              "Please wait until\nyour account\ncreation is approved",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontFamily: "Platypi",
              ),
            ),
          ),
          SizedBox(height: 40),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 700,
                width: 400,
                child: Semicircle(
                  width: 400,
                  height: 200,
                  radius_for_the_circle: 190,
                ),
              ),

              Positioned(
                top: 100,
                child: Lottie.asset(
                  'assets/animation/loading.json',
                  width: 400,
                  height: 400,
                  repeat: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
