
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostumTextFeild extends StatelessWidget {
  String hintText;
  bool obscure;
  bool? isNum=false;
  TextEditingController? controller;
  Function(String)? onchanged;
  CostumTextFeild({
    required this.hintText,
    this.obscure = false,
    this.onchanged,
    this.controller,
    this.isNum});
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
      keyboardType: isNum == true ? TextInputType.number:TextInputType.text,
      inputFormatters: isNum == true ? [FilteringTextInputFormatter.digitsOnly]: <TextInputFormatter>[],
    );
  }
}
