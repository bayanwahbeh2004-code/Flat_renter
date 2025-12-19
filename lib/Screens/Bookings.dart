import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/etate_page/favurites.dart';
import 'package:baytech/Screens/etate_page/my_houses.dart';
import 'package:flutter/material.dart';

class BookingsPage extends StatefulWidget {
  static String id = "Your Estates Page";

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  String selectButton = 'current bookings';

  void selectButNow(String category) {
    setState(() {
      selectButton = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildminuRep(
                  context,
                  'current bookings',
                  isSelected: selectButton == 'current bookings',
                  onTap: () => selectButNow('current bookings'),
                ),
                SizedBox(width: 10),
                _buildminuRep(
                  context,
                  'pending bookings',
                  isSelected: selectButton == 'pending bookings',
                  onTap: () => selectButNow('pending bookings'),
                ),
                SizedBox(width: 10),
                _buildminuRep(
                  context,
                  'cancelled bookings',
                  isSelected: selectButton == 'cancelled bookings',
                  onTap: () => selectButNow('cancelled bookings'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5),
        // Favourites content
        if (selectButton == 'Favourites') Favourites(),
        if (selectButton == 'My houses') MyHouses(),
      ],
    );
  }
}

Widget _buildminuRep(
  BuildContext context,
  String title, {
  bool isSelected = false,
  VoidCallback? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}
