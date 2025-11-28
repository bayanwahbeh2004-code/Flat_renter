import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String id = "Login page";

  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(height: 70),
          Image.asset(Klogo, height: 250, width: 250),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  "Log in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: "Platypi",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Stack(
            children: [
              SizedBox(
                height: 413,
                width: 400,
                child: Semicircle(
                  width: 400,
                  height: 200,
                  radius_for_the_circle: 190,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    CostumTextFeild(
                      hintText: "Phone number",
                      onchanged: (data) {},
                    ),
                    SizedBox(height: 25),
                    CostumTextFeild(
                      hintText: "Password",
                      obscure: true,
                      onchanged: (data) {},
                    ),
                    SizedBox(height: 25),
                    CostumButton(
                      text: "Log in",
                      onTap: () {},
                      buttonColor: Colors.black,
                      textColor: Colors.white,
                      height: 50,
                      width: 225,
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(context, SignupPage.id);
                          },
                          child: Text(
                            "sign up",
                            style: TextStyle(color: KPurple, fontSize: 18),
                          ),
                        ),
                      ],
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
