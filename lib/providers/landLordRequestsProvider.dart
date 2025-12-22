import 'package:baytech/Models/apartment.dart';
import 'package:baytech/Models/book.dart';
import 'package:baytech/services/houses/bookings/landlord/book_requests.dart';
import 'package:baytech/services/houses/bookings/landlord/update_requests.dart';
import 'package:flutter/material.dart';

class landLordRequestsProvider extends ChangeNotifier {
  List<Book> _bookingRequests = [];
  List<Book> _updateRequests = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<Book> get bookingRequests => _bookingRequests;
  List<Book> get updateRequests => _updateRequests;
  Future<void> setBookings(Apartment house, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await getBookingsRequests(context: context, house: house);
      _bookingRequests = result;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _bookingRequests = [];
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> setUpdate(Apartment house, BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      final result = await getUpdateRequests(context: context, house: house);
      _updateRequests = result;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _updateRequests = [];
      _isLoading = false;
      notifyListeners();
    }
  }
}
