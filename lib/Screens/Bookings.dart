import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';

class BookingsPage extends StatelessWidget {
  static String id = "Bookings Page";
  const BookingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "bookings page",
        style: TextStyle(fontSize: 24, color: KPurple),
      ),
    );
  }
}
