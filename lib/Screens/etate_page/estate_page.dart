import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/add_appartment_page.dart';
import 'package:baytech/Screens/etate_page/favurites.dart';
import 'package:baytech/Screens/etate_page/my_houses.dart';
import 'package:baytech/helper/build_grid.dart';
import 'package:baytech/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YourEstatesPage extends StatefulWidget {
  static String id = "Your Estates Page";
  const YourEstatesPage({super.key});

  @override
  State<YourEstatesPage> createState() => _YourEstatesPageState();
}

class _YourEstatesPageState extends State<YourEstatesPage> {
  String selectButton = 'My houses';

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
                  'My houses',
                  isSelected: selectButton == 'My houses',
                  onTap: () => selectButNow('My houses'),
                ),
                SizedBox(width: 10),
                _buildminuRep(
                  'Renting requests',
                  isSelected: selectButton == 'Renting requests',
                  onTap: () => selectButNow('Renting requests'),
                ),
                SizedBox(width: 10),
                _buildminuRep(
                  'Favourites',
                  isSelected: selectButton == 'Favourites',
                  onTap: () => selectButNow('Favourites'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5),
        // Favourites content
        if (selectButton == 'Favourites') Favourites(),
        if (selectButton == 'My houses') MyHouses(),
        //if(selectButton=='Renting requests'),
      ],
    );
  }
}

Widget _buildminuRep(
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
          color: isSelected ? Colors.black : Koption,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}
