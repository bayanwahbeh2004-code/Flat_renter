import 'package:baytech/Models/Filter.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/services/houses/show_houses/filtering.dart';
import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  Filter _filter = Filter();
  List<Apartment> _houses = [];
  bool _isLoading = false;
  Filter get filter => _filter;
  bool get isLoading => _isLoading;
  List<Apartment> get houses => _houses;
  bool get hasActiveFilter => !_filter.isEmpty();
  bool get hasHouses => _houses.isNotEmpty;

  Future<void> setFilter(Filter newFilter, BuildContext context) async {
    try {
      _filter = newFilter;
      _isLoading = true;
      notifyListeners();
      final result = await Filtering(filter: newFilter, context: context);
      _houses = result;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _houses = [];
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear filter
  void clearFilter() {
    _filter = Filter();
    _houses = [];
    notifyListeners();
  }
}
