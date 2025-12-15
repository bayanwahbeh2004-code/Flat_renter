import 'package:baytech/components/custom_drop_down_button.dart';
import 'package:baytech/providers/cities_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityGovernorate extends StatefulWidget {
  String? governorate, city;
  @override
  State<CityGovernorate> createState() => _CityGovernorateState();
}

class _CityGovernorateState extends State<CityGovernorate> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CitiesProvider>(
      builder: (context, citiesProvider, child) {
        return Row(
          children: [
            const Icon(Icons.location_on_outlined),
            CustomDropDownButton(
              hintText: 'governorate',
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
              isGovernorateDropdown: true,
              onGovernorateChanged: (governorate) {
                widget.governorate = governorate;
              },
            ),

            const SizedBox(width: 20),

            const Icon(Icons.location_on_outlined),

            CustomDropDownButton(
              hintText: 'city',
              dropDownValues: citiesProvider.list,
              isGovernorateDropdown: false,
              onCityChanged: (city) {
                widget.city = city;
              },
            ),
          ],
        );
      },
    );
  }
}
