import 'dart:io';

class Account {
  String? phoneNumber, password, token, firstName, secondName;
  int? id;
  File? profilePicture;
  Account({
    this.phoneNumber,
    this.password,
    this.firstName,
    this.secondName,
    this.id,
    this.token,
    this.profilePicture,
  });
  factory Account.fromjson(body) {
    var data = body["User"];
    print("llllllllllllllllllllll\n");
    return Account(
      id: data["id"],
      phoneNumber: data["phone"],
      firstName: data["first_name"],
      secondName: data["last_name"],
      profilePicture: data["personal_photo"],
      token: body["Token"],
    );
  }
}
