import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

class AddingCustomTextField extends StatefulWidget {
  String hintText;
  Function(String)? onchanged;
  double width;
  IconData? icon;
  TextEditingController? controller;
  TextInputType? textInputType;
  AddingCustomTextField({
    this.textInputType,
    required this.hintText,
    this.onchanged,
    required this.width,
    this.icon,
    this.controller,
  });

  @override
  State<AddingCustomTextField> createState() => _AddingCustomTextFieldState();
}

class _AddingCustomTextFieldState extends State<AddingCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Center(
        child: TextFormField(
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          onChanged: widget.onchanged,
          validator: (data) {
            if (data!.isEmpty) {
              return "Field is required";
            }
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: widget.icon != null
                ? Icon(
                    widget.icon,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            contentPadding: EdgeInsets.all(8),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 14,
            ),
            maintainHintSize: true,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
