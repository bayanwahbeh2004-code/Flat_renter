import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/services/users/user_register.dart';
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
    User data = ModalRoute.of(context)!.settings.arguments as User;
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
                      S.of(context).sign_up,
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
                          color: Koption,
                          textInputType: TextInputType.number,
                          hintText: S.of(context).phone_number_hint,
                          onchanged: (data) {
                            phoneNumber = data;
                          },
                        ),
                        SizedBox(height: 25),
                        CostumTextFeild(
                          color: Koption,
                          hintText: S.of(context).password_hint,
                          obscure: true,
                          onchanged: (data) {
                            password = data;
                          },
                        ),
                        SizedBox(height: 25),
                        CostumTextFeild(
                          hintText: S.of(context).confirm_password_hint,
                          obscure: true,
                          onchanged: (data) {
                            confirmPassword = data;
                          },
                        ),
                        SizedBox(height: 25),
                        CostumButton(
                          text: S.of(context).sign_up,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              data.phoneNumber = phoneNumber!;
                              data.password = password!;
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
                            Text(
                              S.of(context).already_have_account,
                              style: TextStyle(color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(
                                  context,
                                  LoginPage.id,
                                );
                              },
                              child: Text(
                                S.of(context).login_title,
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
