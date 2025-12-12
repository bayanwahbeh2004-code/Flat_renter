import 'package:baytech/Screens/HomeApp.dart';
import 'package:baytech/Screens/Waiting_Page.dart';
import 'package:baytech/auth.dart';
import 'package:baytech/services/users/user_active.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:baytech/Screens/Welcome_Page.dart';

class KeyinAnimation extends StatefulWidget {
  static const String id = "KeyinAnimation";
  const KeyinAnimation({super.key});

  @override
  State<KeyinAnimation> createState() => _KeyAnimation();
}

class _KeyAnimation extends State<KeyinAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation<Offset> keymov;
  late Animation<double> keyhz;
  late Animation<double> textmov;

  @override
  void initState() {
    super.initState();

    animationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    keymov =
        Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(
          CurvedAnimation(
            parent: animationcontroller,
            curve: const Interval(
              5.0 / 15.0,
              5.0 / 15.0 + 0.2,
              curve: Curves.easeOutCubic,
            ),
          ),
        );

    keyhz = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationcontroller,
        curve: const Interval(5.0 / 15.0 + 0.2, 0.85, curve: Curves.easeInOut),
      ),
    );

    textmov = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationcontroller,
        curve: const Interval(0.85, 1.0, curve: Curves.easeIn),
      ),
    );

    animationcontroller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        final token = await AuthService.getToken();
        if (token == null)
          Navigator.of(context).pushReplacementNamed(WelcomePage.id);
        else if (await userStatus(context: context)) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.id);
        } else {
          Navigator.of(context).pushReplacementNamed(WaitingPage.id);
        }
      }
    });

    animationcontroller.forward();
  }

  @override
  void dispose() {
    animationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: animationcontroller,
          builder: (context, child) {
            double wiggleAngle = sin(keyhz.value * 15 * pi) * 0.17;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/lock.png', width: 500),

                    Transform.translate(
                      offset: Offset(keymov.value.dx * 400, -5),
                      child: Transform.rotate(
                        angle: wiggleAngle,
                        child: Image.asset('assets/images/key.png', width: 410),
                      ),
                    ),
                  ],
                ),

                Transform.translate(
                  offset: const Offset(0, -220),
                  child: Opacity(
                    opacity: textmov.value,
                    child: Image.asset('assets/images/name.png', height: 300),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
