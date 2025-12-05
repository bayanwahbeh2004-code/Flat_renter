import 'package:baytech/components/SemiCircle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaitingAdmin extends StatelessWidget {
  static String id = "Waiting admin page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: 80),
          Center(
            child: Text(
              "Please wait until\n your account\n creation is approved",
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
                height: 580,
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
