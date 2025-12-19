import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Koption,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
  ),

  colorScheme: ColorScheme.light(
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: KPurple,
    onSecondary: Colors.white,
    primaryContainer: Koption,
    onPrimaryContainer: Colors.grey[800],
    onSurface: Colors.grey,
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 28, 31, 34),
  appBarTheme: const AppBarTheme(
    backgroundColor: const Color.fromARGB(255, 44, 56, 69),
    foregroundColor: Colors.white,
    elevation: 0,
  ),

  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    onPrimary: Colors.black,
    secondary: const Color.fromARGB(255, 199, 120, 199),
    onSecondary: Colors.white,
    primaryContainer: Colors.grey,
    onPrimaryContainer: Colors.grey[800],
    onSurface: const Color.fromARGB(255, 193, 193, 193),
  ),
);
