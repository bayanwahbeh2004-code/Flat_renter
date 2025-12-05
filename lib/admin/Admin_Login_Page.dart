import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Account.dart';
import 'package:baytech/admin/Admin_Signup_page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/services/user_login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatefulWidget {
  static String id = "Admin Login page";
  @override
  State<AdminLoginPage> createState() => _LoginState();
}

class _LoginState extends State<AdminLoginPage> {
  String? phoneNumber, password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: ListView(
            children: [
              SizedBox(height: height*0.04),
              Image.asset(Klogo, height: height*0.35, width: width*0.13),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width*0.08),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height*0.05,
                        fontFamily: "Platypi",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.01),
              Stack(
                children: [
                  SizedBox(
                    height: height*0.53,
                    width: width,
                    child: Semicircle(
                      width: width,
                      height: height*0.31,
                      radius_for_the_circle: 190,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.06),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.06),
                        CostumTextFeild(
                          hintText: "Phone number",
                          onchanged: (data) {
                            phoneNumber = data;
                          },
                        ),
                        SizedBox(height: height*0.02),
                        CostumTextFeild(
                          hintText: "Password",
                          obscure: true,
                          onchanged: (data) {
                            password = data;
                          },
                        ),
                        SizedBox(height: height*0.02),
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
                              await UserLogin(
                                account: account,
                                context: context,
                              );
                            }
                            setState(() {
                              isLoading = false;
                            });
                          },
                          buttonColor: Colors.black,
                          textColor: Colors.white,
                          height: height*0.078,
                          width: width*0.165,
                        ),
                        SizedBox(height: height*0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(
                                  context,
                                  AdminSignupPage.id,
                                );
                              },
                              child: Text(
                                "sign up",
                                style: TextStyle(color: KPurple, fontSize: height*0.028),
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
