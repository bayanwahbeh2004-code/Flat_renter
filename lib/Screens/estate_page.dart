import 'package:baytech/Constants.dart';
import 'package:baytech/Screens/add_appartment_page.dart';
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
    return Consumer<FavouritesProvider>(
      builder: (context, FavouritesProvider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 32),
            child: Row(
              children: [
                _buildminuRep(
                  'My houses',
                  isSelected: selectButton == 'My houses',
                  onTap: () => selectButNow('My houses'),
                ),
                SizedBox(width: 100),
                _buildminuRep(
                  'Favourites',
                  isSelected: selectButton == 'Favourites',
                  onTap: () => selectButNow('Favourites'),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Stack(
              children: [
                // Favourites content
                if (selectButton == 'Favourites')
                  FavouritesProvider.favourites.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.home_work_outlined,
                                size: 64,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'No houses found',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        )
                      : Container(
                          height: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: buildGrid(FavouritesProvider.favourites),
                          ),
                        ),

                // My houses content
                if (selectButton == 'My houses')
                  Center(
                    child: Text(
                      'My Houses Content Here',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                // Floating Action Button - always in Stack but positioned conditionally
                if (selectButton == 'My houses')
                  Positioned(
                    bottom: 40,
                    right: 50,
                    child: FloatingActionButton(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.add),
                      onPressed: () {
                        Navigator.pushNamed(context, AddAppartmentPage.id);
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
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
