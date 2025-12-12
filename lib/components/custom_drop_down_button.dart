import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  String selectedItem;
  List<String> dropDownValues;
  CustomDropDownButton({
    required this.selectedItem,
    required this.dropDownValues,
  });
  @override
  State<CustomDropDownButton> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomDropDownButton> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: widget.dropDownValues
          .map(
            (value) =>
                DropdownMenuItem<String>(value: value, child: Text(value)),
          )
          .toList(),
      value: selectedItem == widget.selectedItem ? null : selectedItem,
      hint: Text(widget.selectedItem),
      onChanged: (item) {
        setState(() {
          widget.selectedItem = item!;
          selectedItem = item;
        });
      },
    );
  }
}
