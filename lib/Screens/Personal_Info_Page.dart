import 'dart:io';

import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/components/upload_image.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  static String id = "Personal information page";

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Register account = Register();

  DateTime? birthdate;
  File? identityCard;
  File? profilePicture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(height: 40),

            // ================= Title =================
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                "Personal information",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "Platypi",
                ),
              ),
            ),

            const SizedBox(height: 60),

            // ================= Background =================
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

                // ================= Content =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 70),

                      CostumTextFeild(
                        hintText: "Enter your first name",
                        onchanged: (data) {
                          account.firstName = data;
                        },
                      ),

                      const SizedBox(height: 25),

                      CostumTextFeild(
                        hintText: "Enter your second name",
                        onchanged: (data) {
                          account.secondName = data;
                        },
                      ),

                      const SizedBox(height: 25),

                      // ================= Images =================
                      Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(width: 15),
                              Text("Identity card"),
                              SizedBox(width: 100),
                              Text("Profile picture"),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              UploadImage(
                                height: 180,
                                width: 150,
                                image: identityCard,
                                type: "id",
                                onPick: (file) {
                                  setState(() {
                                    identityCard = file;
                                  });
                                },
                              ),

                              const SizedBox(width: 20),

                              UploadImage(
                                height: 180,
                                width: 150,
                                image: profilePicture,
                                type: "profile",
                                onPick: (file) {
                                  setState(() {
                                    profilePicture = file;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // ================= Birthdate =================
                      CostumButton(
                        text: "Birth date",
                        height: 50,
                        width: 225,
                        buttonColor: Colors.white,
                        textColor: Colors.black,
                        onTap: () async {
                          birthdate = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2020),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme:
                                      const ColorScheme.light(primary: KPurple),
                                ),
                                child: child!,
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 15),

                      // ================= Next =================
                      CostumButton(
                        text: "Next",
                        height: 50,
                        width: 225,
                        buttonColor: Colors.black,
                        textColor: Colors.white,
                        onTap: () {
                          if (formKey.currentState!.validate() &&
                              birthdate != null &&
                              identityCard != null &&
                              profilePicture != null) {
                            Navigator.pushNamed(
                              context,
                              SignupPage.id,
                              arguments: Register(
                                firstName: account.firstName!,
                                secondName: account.secondName!,
                                birthday: birthdate.toString(),
                                indentityCard: identityCard!,
                                profilePicture: profilePicture!,
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
                      ),

                      const SizedBox(height: 30),

                      // ================= Login =================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginPage.id);
                            },
                            child: const Text(
                              "log in",
                              style: TextStyle(
                                color: KPurple,
                                fontSize: 18,
                              ),
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
