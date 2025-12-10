import 'package:baytech/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData = lightmode;
  set(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }

  void toggleTheme(ThemeData theme) {
    themeData = theme;
  }
}
