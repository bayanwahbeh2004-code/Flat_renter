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
  factory RegisterRequest.fromMap(Map<String, dynamic> map, Account account) {
    return RegisterRequest(
      account: account,
      firstName: map['first_name'],
      secondName: map['last_name'],
      birthday: map['date_of_birth'],
      indentityCard: map['Personal_identity_photo'],
      profilePicture: map['personal_photo']
    );
  }
}
