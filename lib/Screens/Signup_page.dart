import 'dart:io';

import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Account.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/services/user_register.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends StatefulWidget {
  static String id = "Sign up page";

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? phoneNumber, password, confirmPassword;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegisterRequest data =
        ModalRoute.of(context)!.settings.arguments as RegisterRequest;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: 40),
              Image.asset(Klogo, height: 200, width: 200),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Text(
                      "Sign up",
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
                    height: 540,
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
                          onchanged: (data) {
                            phoneNumber = data;
                          },
                        ),
                        SizedBox(height: 25),
                        CostumTextFeild(
                          hintText: "Password",
                          obscure: true,
                          onchanged: (data) {
                            password = data;
                          },
                        ),
                        SizedBox(height: 25),
                        CostumTextFeild(
                          hintText: "Confirm password",
                          obscure: true,
                          onchanged: (data) {
                            confirmPassword = data;
                          },
                        ),
                        SizedBox(height: 25),
                        CostumButton(
                          text: "Sign up",
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                               print(data.profilePicture is File);
                              setState(() {
                                isLoading = true;
                              });
                              data.account = Account(
                                phoneNumber: phoneNumber!,
                                password: password!,
                              );
                              await UserRegister(
                                data: data,
                                context: context,
                                confirmPassword: confirmPassword!,
                              );
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          buttonColor: Colors.black,
                          textColor: Colors.white,
                          height: 50,
                          width: 225,
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Alredy have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(
                                  context,
                                  LoginPage.id,
                                );
                              },
                              child: Text(
                                "log in",
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
        ),
      ),
    );
  }
}
