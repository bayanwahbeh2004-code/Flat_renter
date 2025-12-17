import 'package:flutter/material.dart';

class CitiesProvider extends ChangeNotifier {
  List<String> _list = [];
  List<String> get list => _list;
  void set(List<String> cities) {
    _list = cities;
    notifyListeners();
  }
}
