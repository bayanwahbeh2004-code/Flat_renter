import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Account.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/admin/Admin_Login_Page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/services/admin_register.dart';
import 'package:baytech/services/user_register.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AdminSignupPage extends StatefulWidget {
  static String id = "Admin Sign up page";

  @override
  State<AdminSignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<AdminSignupPage> {
  String? first_name, last_name, confirmPassword, password, phoneNumber;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              SizedBox(height: height * 0.1),
              Image.asset(Klogo, height: height * 0.35, width: width * 0.13),
              SizedBox(height: height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.1),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.07,
                        fontFamily: "Platypi",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.09),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    child: SizedBox(
                      height: height * 1.15,
                      width: width * 0.95,
                      child: Semicircle(
                        width: width * 0.95,
                        height: height * 1.15,
                        radius_for_the_circle: width * 0.6,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.3,
                      right: width * 0.3,
                      top: height * 0.06,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.04),
                        CostumTextFeild(
                          hintText: "First name",
                          onchanged: (data) {
                            first_name = data;
                          },
                        ),
                        SizedBox(height: height * 0.04),
                        CostumTextFeild(
                          hintText: "last name",
                          onchanged: (data) {
                            last_name = data;
                          },
                        ),
                        SizedBox(height: height * 0.04),
                        CostumTextFeild(
                          hintText: "Phone number",
                          onchanged: (data) {
                            phoneNumber = data;
                          },
                        ),
                        SizedBox(height: height * 0.04),
                        CostumTextFeild(
                          hintText: "Password",
                          obscure: true,
                          onchanged: (data) {
                            password = data;
                          },
                        ),
                        SizedBox(height: height * 0.04),
                        CostumTextFeild(
                          hintText: "Confirm password",
                          obscure: true,
                          onchanged: (data) {
                            confirmPassword = data;
                          },
                        ),
                        SizedBox(height: height * 0.07),
                        CostumButton(
                          text: "Sign up",
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              Account account = Account(
                                phoneNumber: phoneNumber!,
                                password: password!,
                              );
                              await AdminRegister(
                                context: context,
                                account: account,
                                passwordConfirm: confirmPassword!,
                                firt_name: first_name!,
                                last_name: last_name!,
                              );
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          buttonColor: Colors.black,
                          textColor: Colors.white,
                          height: height * 0.078,
                          width: width * 0.165,
                        ),
                        SizedBox(height: height * 0.04),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Alredy have an account? ",
                              style: TextStyle(fontSize: width * 0.01),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(
                                  context,
                                  AdminLoginPage.id,
                                );
                              },
                              child: Text(
                                "log in",
                                style: TextStyle(
                                  color: KPurple,
                                  fontSize: width * 0.01,
                                ),
                              ),
                            ),
                            SizedBox(height: height * 0.15),
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
