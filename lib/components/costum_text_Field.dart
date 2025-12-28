import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CostumTextFeild extends StatefulWidget {
  String hintText;
  bool? obscure;
  TextInputType? textInputType;
  TextEditingController? controller;
  Color? color;
  Function(String)? onchanged;
  CostumTextFeild({
    required this.hintText,
    this.textInputType,
    this.color,
    this.obscure,
    this.onchanged,
    this.controller,
  });

  @override
  State<CostumTextFeild> createState() => _CostumTextFeildState();
}

class _CostumTextFeildState extends State<CostumTextFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      keyboardType: widget.textInputType,
      onChanged: widget.onchanged,
      obscureText: widget.obscure ?? false,
      validator: (data) {
        if (data!.isEmpty) {
          return "Field is required";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor:
            widget.color ?? Theme.of(context).colorScheme.primaryContainer,
        contentPadding: EdgeInsets.only(bottom: 18, left: 15, top: 18),
        labelText: widget.hintText,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14,
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 14,
        ),
        suffixStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        suffix: widget.obscure != null
            ? Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.obscure = !widget.obscure!;
                    });
                  },
                  child: Icon(
                    widget.obscure! ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              )
            : SizedBox(),
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
