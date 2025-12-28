import 'dart:io';
import 'package:flutter/foundation.dart';

class User {
  String? phoneNumber,
      password,
      token,
      firstName,
      secondName,
      birthday,
      role,
      indentityCardPath,
      profilePicturePath;
  int? id;
  File? profilePicture, indentityCard;
  String? active;
  String? account;
  User({
    this.account,
    this.active,
    this.phoneNumber,
    this.password,
    this.token,
    this.role,
    this.firstName,
    this.secondName,
    this.birthday,
    this.id,
    this.indentityCard,
    this.indentityCardPath,
    this.profilePicture,
    this.profilePicturePath,
  });
  factory User.fromjson(user) {
    return User(
      id: user['id'],
      firstName: user['first_name'] ?? '',
      secondName: user['last_name'] ?? '',
      phoneNumber: user['phone'] ?? '',
      birthday: user['date_of_birth'] ?? '',
      indentityCardPath: user['Personal_identity_photo'] ?? '',
      profilePicturePath: user['personal_photo'] ?? '',
      password: user['password'] ?? '',
      role: user['role'] ?? '',
      active: user['active'] ?? '',
      account: user['account'] ?? '',
    );
  }
}
