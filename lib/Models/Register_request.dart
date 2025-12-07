import 'dart:io';
import 'package:baytech/Models/Account.dart';
import 'package:flutter/foundation.dart';

class RegisterRequest {
  Account? account;
  String firstName, secondName, birthday;
  File profilePicture, indentityCard;
  RegisterRequest({
    this.account,
    required this.firstName,
    required this.secondName,
    required this.birthday,
    required this.indentityCard,
    required this.profilePicture
  });
  factory RegisterRequest.fromjson(data, Account account) {
    return RegisterRequest(
      account: account,
      firstName: data['first_name'],
      secondName: data['last_name'],
      birthday: data['date_of_birth'],
      indentityCard: data['Personal_identity_photo'],
      profilePicture: data['personal_photo']
    );
  }
}
