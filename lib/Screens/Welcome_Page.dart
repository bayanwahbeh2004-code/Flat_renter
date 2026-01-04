import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static String id = "Welcom page";

  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: 100),
          Image.asset(Klogo, height: 250, width: 250),
          SizedBox(height: 60),
          Stack(
            children: [
              SizedBox(
                height: 500,
                width: 400,
                child: Semicircle(
                  width: 500,
                  height: 200,
                  radius_for_the_circle: 400,
                ),
              ),

              Center(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      S.of(context).welcome_title,
                      style: TextStyle(
                        fontSize: 36,
                        color: Color(0xff545454),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      S.of(context).welcome_sub1,
                      style: TextStyle(color: ktextColor, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      S.of(context).welcome_sub2,
                      style: TextStyle(color: ktextColor, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    CostumButton(
                      text: S.of(context).login_title,
                      onTap: () {
                        Navigator.popAndPushNamed(context, LoginPage.id);
                      },
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                      height: 50,
                      width: 225,
                    ),
                    SizedBox(height: 20),
                    CostumButton(
                      text: S.of(context).sign_up,
                      onTap: () {
                        Navigator.popAndPushNamed(context, PersonalInfoPage.id);
                      },
                      buttonColor: Colors.white,
                      textColor: Colors.black,
                      height: 50,
                      width: 225,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
