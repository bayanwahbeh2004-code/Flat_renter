import 'package:baytech/Models/Filter.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/services/houses/favourite/favourite_houses_list.dart';
import 'package:baytech/services/houses/show_houses/filtering.dart';
import 'package:flutter/material.dart';

class FavouritesProvider extends ChangeNotifier {
  List<Apartment> _favourites = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Apartment> get favourites => _favourites;
  bool get hasHouses => _favourites.isNotEmpty;

  Future<void> setFavourites(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await FavouriteHousesList( context: context);
      _favourites = result;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _favourites = [];
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear filter
  void clearFavourites() {
    _favourites = [];
    notifyListeners();
  }
}
