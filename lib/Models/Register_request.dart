import 'package:baytech/Models/Account.dart';

class RegisterRequest {
  Account account;
  String firstName, secondName, birthday, indentityCard;
  String? profilePicture;
  RegisterRequest({
    required this.account,
    required this.firstName,
    required this.secondName,
    required this.birthday,
    required this.indentityCard,
    this.profilePicture,
  });
}
