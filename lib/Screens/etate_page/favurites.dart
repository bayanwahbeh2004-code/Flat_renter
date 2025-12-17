import 'package:baytech/helper/build_grid.dart';
import 'package:baytech/providers/favourites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<FavouritesProvider>();
      provider.setFavourites(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouritesProvider>(
      builder: (context, FavouritesProvider, child) =>
       Container(
        height: 500,
        child: FavouritesProvider.favourites.isEmpty
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
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: buildGrid(FavouritesProvider.favourites, false),
              ),
      ),
    );
  }
}
