import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primaryContainer: Colors.white, //scaffold color
    primary: Colors.black, //buttons and taps color
    secondary: KPurple, //dialog's text color
    onSurface: Colors.black, //text color
    onSecondary: ktextColor, //color of text fields
  ),
);
ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primaryContainer: Colors.grey[650], //scaffold
    primary: Colors.black,
    secondary: KPurple,
    onSurface: Colors.black,
    onSecondary: ktextColor,
  ),
);
