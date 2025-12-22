import 'package:baytech/Models/book.dart';
import 'package:baytech/services/houses/bookings/renter/myBookingsAsUser.dart';
import 'package:flutter/material.dart';

class BookingsProvider extends ChangeNotifier {
  List<Book> _myBookings = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Book> get myBookings => _myBookings;

  Future<void> setBookings(String type, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await getMyBookingsAsUser(type: type, context: context);
      _myBookings = result;
      _isLoading = false;
      print(myBookings.length);
      notifyListeners();
    } catch (e) {
      _myBookings = [];
      _isLoading = false;
      notifyListeners();
    }
  }
}
