import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: KPurple,
      duration: Duration(seconds: 1),
      content: Text(message, style: TextStyle(color: Colors.white)),
      shape: ShapeBorder.lerp(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        1,
      ),
    ),
  );
}
