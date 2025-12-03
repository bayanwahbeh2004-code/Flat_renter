import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  String selectedItem = "category";
  @override
  State<CustomDropDownButton> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomDropDownButton> {
  List<String> dropDownValues = [
    "Hotels",
    "Rooms",
    "Duplex",
    "Villa",
    "Suites",
    "Apartment",
    "House",
    "Others",
  ];
  String selectedItem = "category";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: dropDownValues
          .map(
            (value) =>
                DropdownMenuItem<String>(value: value, child: Text(value)),
          )
          .toList(),
      value: selectedItem == "category" ? null : selectedItem,
      hint: Text("category"),
      onChanged: (item) {
        setState(() {
          widget.selectedItem = item!;
          selectedItem = item;
        });
      },
    );
  }
}
