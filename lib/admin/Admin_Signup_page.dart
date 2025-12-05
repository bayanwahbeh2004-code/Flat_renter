import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Account.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/admin/Admin_Login_Page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/services/user_register.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AdminSignupPage extends StatefulWidget {
  static String id = "Admin Sign up page";

  @override
  State<AdminSignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<AdminSignupPage> {
  String? phoneNumber, password, confirmPassword;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    RegisterRequest? data =
        ModalRoute.of(context)!.settings.arguments as RegisterRequest;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: height*0.04),
              Image.asset(Klogo, height: height*0.35, width: width*0.13),
              SizedBox(height: height*0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width*0.08),
                    child: Text(
                      "Sign up",
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
                    padding: EdgeInsets.symmetric(horizontal: width*0.0),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.53),
                        CostumTextFeild(
                          hintText: "Phone number",
                          onchanged: (data) {
                            phoneNumber = data;
                          },
                        ),
                        SizedBox(height: height*0.06),
                        CostumTextFeild(
                          hintText: "Password",
                          obscure: true,
                          onchanged: (data) {
                            password = data;
                          },
                        ),
                        SizedBox(height: height*0.02),
                        CostumTextFeild(
                          hintText: "Confirm password",
                          obscure: true,
                          onchanged: (data) {
                            confirmPassword = data;
                          },
                        ),
                        SizedBox(height: height*0.02),
                        CostumButton(
                          text: "Sign up",
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
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
                          height: height*0.078,
                          width:  width*0.165,
                        ),
                        SizedBox(height: height*0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Alredy have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(
                                  context,
                                  AdminLoginPage.id,
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
