import 'dart:convert';
import 'package:baytech/Constants.dart';
import 'package:baytech/Models/Register_request.dart';
import 'package:baytech/helper/api.dart';
import 'package:baytech/helper/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:baytech/Screens/Waiting_Admin.dart';
Future<void> UserRegister({
  required RegisterRequest data,
  required BuildContext context,
  required String confirmPassword
}) async {
  String url = KbaseUrl + "register";
  try {
    Response response = await Api().post(
      url: url,
      body: {
        "first_name": data.firstName,
        "last_name": data.secondName,
        "date_of_birth": data.birthday,
        "Personal_identity_photo": data.indentityCard,
        "personal_photo": data.profilePicture,
        "phoneNumber": data.account!.phoneNumber,
        "password": data.account!.password,
        "confirmPassword": confirmPassword,
      },
    );
    var meesage = jsonDecode(response.body);
    showSnackBar(context: context, message: meesage["message"]);
    Navigator.popAndPushNamed(
                                context,
                                WaitingAdmin.id,
                                arguments: data,
                              );
  } catch (e) {
    showSnackBar(context: context, message:"something went wrong");
  }
}
