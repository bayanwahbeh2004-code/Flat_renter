import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Account.dart';
import 'package:baytech/Screens/Personal_Info_Page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String id = "Login page";
  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  String? phoneNumber, password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: ListView(
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
                        CostumButton(
                          text: "Log in",
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            if (formKey.currentState!.validate()) {
                              Account account = Account(
                                password: password!,
                                phoneNumber: phoneNumber!,
                              );
                              // log in method;
                            }
                            setState(() {
                              isLoading = false;
                            });
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
                            Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(
                                  context,
                                  PersonalInfoPage.id,
                                );
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
        ),
      ),
    );
  }
}
