import 'dart:io';

import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Account.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/components/upload_image.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatelessWidget {
  static String id = "Personal information page";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Account account = Account();
  DateTime? birthdate;
  File? identityCard, profilePicture;
  UploadImage? IdImageuploader, ProfileimageUploader;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Personal information",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: "Platypi",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Stack(
              children: [
                SizedBox(
                  height: 700,
                  width: 400,
                  child: Semicircle(
                    width: 400,
                    height: 200,
                    radius_for_the_circle: 225,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      CostumTextFeild(
                        hintText: "Enter your first name",
                        onchanged: (data) {
                          account.firstName = data;
                        },
                      ),
                      SizedBox(height: 25),
                      CostumTextFeild(
                        hintText: "Enter your second name",
                        onchanged: (data) {
                          account.secondName = data;
                        },
                      ),
                      SizedBox(height: 25),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 15),
                              Text("Identity card"),
                              SizedBox(width: 100),
                              Text("profile picture"),
                            ],
                          ),
                          Row(
                            children: [
                              IdImageuploader = UploadImage(
                                height: 180,
                                width: 150,
                                type: "id",
                              ),
                              SizedBox(width: 20),
                              ProfileimageUploader = UploadImage(
                                height: 180,
                                width: 150,
                                type: "profile",
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      CostumButton(
                        text: "Birth date",
                        onTap: () async {
                          birthdate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2020),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: KPurple,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: KPurple,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                        },
                        textColor: Colors.black,
                        buttonColor: Colors.white,
                        height: 50,
                        width: 225,
                      ),
                      SizedBox(height: 10),
                      CostumButton(
                        text: "Next",
                        onTap: () {
                          identityCard = IdImageuploader!.image;
                          account.profilePicture = ProfileimageUploader!.image;
                          if (formKey.currentState!.validate() &&
                              birthdate != null &&
                              identityCard != null &&
                              profilePicture != null) {
                            Navigator.pushNamed(
                              context,
                              SignupPage.id,
                              arguments: RegisterRequest(
                                firstName: account.firstName!,
                                secondName: account.secondName!,
                                birthday: birthdate.toString(),
                                indentityCard: identityCard!,
                                profilePicture: account.profilePicture!,
                              ),
                            );
                          } else if (identityCard == null) {
                            showDialoge(
                              context,
                              message: "Please upload your identity card",
                            );
                          } else if (profilePicture == null) {
                            showDialoge(
                              context,
                              message: "Please upload your profile picture",
                            );
                          } else if (birthdate == null) {
                            showDialoge(
                              context,
                              message: "Please select your birth date",
                            );
                          } else {
                            showDialoge(
                              context,
                              message: "Something went wrong",
                            );
                          }
                        },
                        buttonColor: Colors.black,
                        textColor: Colors.white,
                        height: 50,
                        width: 225,
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Alredy have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.popAndPushNamed(context, LoginPage.id);
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
    );
  }
}
