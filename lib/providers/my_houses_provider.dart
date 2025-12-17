
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/services/houses/show_houses/get_my_houses.dart';
import 'package:flutter/material.dart';

class MyHousesProvider extends ChangeNotifier {
  List<Apartment> _myHouses = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Apartment> get MyHouses => _myHouses;
  bool get hasHouses => _myHouses.isNotEmpty;

  Future<void> setMyHouses(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await getHousesForOwner(context: context);
      _myHouses = result;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _myHouses = [];
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear filter
  void clearFavourites() {
    _myHouses = [];
    notifyListeners();
  }
}
