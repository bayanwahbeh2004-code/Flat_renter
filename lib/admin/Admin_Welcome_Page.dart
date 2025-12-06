import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/admin/Admin_Login_Page.dart';
import 'package:baytech/admin/Admin_Signup_page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:flutter/material.dart';

class AdminWelcomePage extends StatelessWidget {
  static String id = "Admin Welcom page";

  const AdminWelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: height*0.08),
          Image.asset(Klogo, height: height*0.35, width: width*0.13),
          SizedBox(height: height*0.07),
          Stack(
            children: [
              SizedBox(
                height: height*0.5,
                width: width,
                child: Semicircle(
                  width: width,
                  height: height*0.3,
                  radius_for_the_circle: 400,
                ),
              ),

              Center(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "WELCOME",
                      style: TextStyle(
                        fontSize: 36,
                        color: Color(0xff545454),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Find your next space, feel at home",
                      style: TextStyle(color: ktextColor, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Where comfort meets convenience",
                      style: TextStyle(color: ktextColor, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    CostumButton(
                      text: "Log in",
                      onTap: () {
                        Navigator.popAndPushNamed(context, AdminLoginPage.id);
                      },
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                      height: 50,
                      width: 225,
                    ),
                    SizedBox(height: 20),
                    CostumButton(
                      text: "Sign up",
                      onTap: () {
                        Navigator.popAndPushNamed(context, AdminSignupPage.id);
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
