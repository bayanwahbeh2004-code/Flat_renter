import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  String text;
  VoidCallback onTap;
  Color buttonColor, textColor;
  double height, width;
  CostumButton({
    required this.text,
    required this.onTap,
    required this.textColor,
    required this.buttonColor,
    required this.height,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.onSurface,),
          borderRadius: BorderRadius.circular(32),
          color: buttonColor,
        ),
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 16, color: textColor)),
        ),
      ),
    );
  }
}
