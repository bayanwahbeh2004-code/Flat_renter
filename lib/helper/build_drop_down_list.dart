import 'package:baytech/components/custom_drop_down_button.dart';
import 'package:baytech/services/houses/getCitesForGovernorate.dart';
import 'package:flutter/material.dart';

class CityGovernorate extends StatefulWidget {
  final Function(String?, String?)? onChanged;
  final String? governorate;
  final String? city;
  String? hintcity, hintgov;
  CityGovernorate({
    Key? key,
    this.city,
    this.governorate,
    this.onChanged,
    this.hintcity,
    this.hintgov,
  }) : super(key: key);

  @override
  State<CityGovernorate> createState() => _CityGovernorateState();
}

class _CityGovernorateState extends State<CityGovernorate> {
  String? _selectedGovernorate;
  String? _selectedCity;
  List<String> _cities = [];
  bool _loadingCities = false;

  @override
  void initState() {
    super.initState();
    _selectedGovernorate = widget.governorate;
    _selectedCity = widget.city;
    if (_selectedGovernorate != null) {
      _loadCitiesForGovernorate(_selectedGovernorate!);
    }
  }

  Future<void> _loadCitiesForGovernorate(String governorate) async {
    setState(() {
      _loadingCities = true;
      _cities = [];
      _selectedCity = null;
    });

    try {
      final cities = await getCitesForGovernorate(
        context: context,
        governorate: governorate,
      );

      setState(() {
        _cities = cities;
        _loadingCities = false;
      });
      if (widget.city != null &&
          _selectedGovernorate == widget.governorate &&
          cities.contains(widget.city)) {
        _selectedCity = widget.city;
        _notifyParent();
      }
    } catch (e) {
      setState(() {
        _loadingCities = false;
        _cities = [];
      });
    }
  }

  void _notifyParent() {
    if (widget.onChanged != null) {
      widget.onChanged!(_selectedGovernorate, _selectedCity);
    }
  }

  @override
  void didUpdateWidget(CityGovernorate oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.governorate != oldWidget.governorate) {
      setState(() {
        _selectedGovernorate = widget.governorate;
        if (_selectedGovernorate != null) {
          _loadCitiesForGovernorate(_selectedGovernorate!);
        } else {
          _cities = [];
          _selectedCity = null;
        }
      });
    }

    if (widget.city != oldWidget.city) {
      setState(() {
        _selectedCity = widget.city;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        CustomDropDownButton(
          hintText: widget.hintgov ?? 'Governorate',
          dropDownValues: const [
            'Damascus',
            'Rif_Damascus',
            'Aleppo',
            'Homs',
            'Hama',
            'Latakia',
            'Tartus',
            'Daraa',
            'Sweida',
            'Quneitra',
            'Idlib',
            'Raqqa',
            'Deir_Ezzor',
            'Hasakah',
          ],
          value: _selectedGovernorate,
          onChanged: (String? newValue) {
            if (newValue != _selectedGovernorate) {
              setState(() {
                _selectedGovernorate = newValue;
              });

              if (newValue != null) {
                _loadCitiesForGovernorate(newValue);
              } else {
                setState(() {
                  _cities = [];
                  _selectedCity = null;
                });
              }
              _notifyParent();
            }
          },
        ),

        const SizedBox(width: 20),
        const Icon(Icons.location_on_outlined),

        if (_loadingCities)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          )
        else
          CustomDropDownButton(
            hintText: widget.hintcity ?? 'City',
            dropDownValues: _cities,
            value: _selectedCity,
            onChanged: _selectedGovernorate == null
                ? null
                : (String? newValue) {
                    if (newValue != _selectedCity) {
                      setState(() {
                        _selectedCity = newValue;
                      });
                      _notifyParent();
                    }
                  },
          ),
      ],
    );
  }
}
