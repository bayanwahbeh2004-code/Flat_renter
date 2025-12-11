import 'package:baytech/Models/User.dart';
import 'package:baytech/services/users/get_user.dart';
import 'package:flutter/material.dart';

Future<bool> userStatus({required BuildContext context}) async {
  User user = await getUser(context: context);
  if (user.active == null) return false;
  return (user.active == 'active');

}
