import 'package:baytech/Models/Account.dart';
import 'package:flutter/foundation.dart';

class RegisterRequest {
  Account? account;
  String firstName, secondName, birthday, indentityCard;
  String? profilePicture;
  RegisterRequest({
    this.account,
    required this.firstName,
    required this.secondName,
    required this.birthday,
    required this.indentityCard,
    this.profilePicture
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
