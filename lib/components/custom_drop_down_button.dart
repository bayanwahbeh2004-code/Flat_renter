import 'package:baytech/providers/cities_provider.dart';
import 'package:baytech/services/houses/getCitesForGovernorate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDropDownButton extends StatefulWidget {
  final String hintText;
  final List<String> dropDownValues;
  final bool isGovernorateDropdown;
  final Function(String)? onGovernorateChanged, onCityChanged;

  const CustomDropDownButton({
    Key? key,
    required this.hintText,
    required this.dropDownValues,
    this.isGovernorateDropdown = false,
    this.onGovernorateChanged,
    this.onCityChanged,
  }) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? _selectedValue;

  @override
  void didUpdateWidget(CustomDropDownButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!widget.isGovernorateDropdown &&
        oldWidget.dropDownValues != widget.dropDownValues) {
      if (_selectedValue != null &&
          !widget.dropDownValues.contains(_selectedValue!)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {
              _selectedValue = null;
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final uniqueValues = widget.dropDownValues.toSet().toList();
    final validSelectedValue =
        _selectedValue != null && uniqueValues.contains(_selectedValue!)
        ? _selectedValue
        : null;

    return DropdownButton<String>(
      items: uniqueValues
          .map(
            (value) =>
                DropdownMenuItem<String>(value: value, child: Text(value)),
          )
          .toList(),
      value: validSelectedValue,
      hint: Text(widget.hintText),
      onChanged: (item) async {
        if (item != null) {
          setState(() {
            _selectedValue = item;
          });

          if (widget.isGovernorateDropdown) {
            if (widget.onGovernorateChanged != null) {
              widget.onGovernorateChanged!(item);
            }
            Provider.of<CitiesProvider>(context, listen: false).set([]);
            List<String> cities = await getCitesForGovernorate(
              context: context,
              governorate: item,
            );
            final uniqueCities = cities.toSet().toList();
            Provider.of<CitiesProvider>(
              context,
              listen: false,
            ).set(uniqueCities);
          } else {
            widget.onCityChanged!(item);
          }
        }
      },
    );
  }
}
