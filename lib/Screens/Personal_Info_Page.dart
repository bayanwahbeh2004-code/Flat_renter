import 'dart:io';

import 'package:baytech/Constants.dart';
import 'package:baytech/Models/User.dart';
import 'package:baytech/Screens/Login_Page.dart';
import 'package:baytech/Screens/Signup_page.dart';
import 'package:baytech/components/SemiCircle.dart';
import 'package:baytech/components/costum_button.dart';
import 'package:baytech/components/costum_text_Field.dart';
import 'package:baytech/components/upload_image.dart';
import 'package:baytech/generated/l10n.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  static String id = "Personal information page";

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final User account = User();
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
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                S.of(context).personal_info_title.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: "Platypi",
                ),
              ),
            ),
            const SizedBox(height: 60),
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
                      const SizedBox(height: 70),
                      CostumTextFeild(
                        color: Koption,
                        hintText: S.of(context).first_name_hint.toString(),
                        onchanged: (data) {
                          account.firstName = data;
                        },
                      ),
                      const SizedBox(height: 25),
                      CostumTextFeild(
                        color: Koption,
                        hintText: S.of(context).last_name_hint.toString(),
                        onchanged: (data) {
                          account.secondName = data;
                        },
                      ),
                      const SizedBox(height: 25),
                      Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 15),
                              Text(
                                S.of(context).identity_card_label.toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 100),
                              Text(
                                S.of(context).profile_picture_label,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              UploadImage(
                                light: true,
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
                                light: true,
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

                      CostumButton(
                        text: S.of(context).birth_date_btn,
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
                                  colorScheme: const ColorScheme.light(
                                    primary: KPurple,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 15),

                      CostumButton(
                        text: S.of(context).next_btn,
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
                              arguments: User(
                                profilePicturePath: profilePicture!.path,
                                indentityCardPath: identityCard!.path,
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
                              child: Text(
                                S.of(context).err_upload_id,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          } else if (profilePicture == null) {
                            showDialoge(
                              context,
                              child: Text(
                                S.of(context).err_upload_profile,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          } else if (birthdate == null) {
                            showDialoge(
                              context,
                              child: Text(
                                S.of(context).err_select_birth,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          } else {
                            showDialoge(
                              context,
                              child: Text(
                                S.of(context).error_in,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).already_have_account,
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginPage.id);
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
    );
  }
}
