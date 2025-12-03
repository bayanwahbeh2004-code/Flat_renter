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
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.only(bottom: 18, left: 15, top: 18),
        labelText: hintText,
        labelStyle: TextStyle(
          color: const Color.fromARGB(255, 106, 105, 105),
          fontSize: 14,
        ),
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
