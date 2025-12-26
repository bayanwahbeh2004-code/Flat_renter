import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  final String hintText;
  final List<String> dropDownValues;
  final String? value;
  final Function(String?)? onChanged;

  const CustomDropDownButton({
    Key? key,
    required this.hintText,
    required this.dropDownValues,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uniqueValues = dropDownValues.toSet().toList();

    return DropdownButton<String>(
      value: value, // Directly use the value
      items: uniqueValues.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        );
      }).toList(),
      hint: Text(
        hintText,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
      onChanged: onChanged,
      isExpanded: false,
      underline: Container(
        height: 1,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
