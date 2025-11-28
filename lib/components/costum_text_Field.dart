import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

class CostumTextFeild extends StatelessWidget {
  String hintText;
  bool obscure;
  Function(String) onchanged;
  CostumTextFeild({
    required this.hintText,
    this.obscure = false,
    required this.onchanged,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      obscureText: obscure,
      validator: (data) {
        if (data!.isEmpty) {
          return "Field is required";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 15, left: 28, top: 15),
        labelText: hintText,
        labelStyle: TextStyle(color: const Color.fromARGB(255, 106, 105, 105)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
