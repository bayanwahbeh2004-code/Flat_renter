import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

class AddingCustomTextField extends StatelessWidget {
  String hintText;
  Function(String) onchanged;
  double width;
  IconData? icon;
  AddingCustomTextField({
    required this.hintText,
    required this.onchanged,
    required this.width,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Center(
        child: TextFormField(
          onChanged: onchanged,
          validator: (data) {
            if (data!.isEmpty) {
              return "Field is required";
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, size: 30) : null,
            contentPadding: EdgeInsets.all(8),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            maintainHintSize: true,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
