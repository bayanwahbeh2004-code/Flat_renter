import 'package:baytech/Constants.dart';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/providers/favourites_provider.dart';
import 'package:baytech/services/houses/favourite/add_to_favourite.dart';
import 'package:baytech/services/houses/favourite/remove_from_favourite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeartIconButton extends StatefulWidget {
  Apartment house;
  bool isFavourite;
  HeartIconButton({required this.house, required this.isFavourite});

  @override
  HeartIconButtonState createState() => HeartIconButtonState();
}

class HeartIconButtonState extends State<HeartIconButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouritesProvider>(
      builder: (context, FavouritesProvider, child) => IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          widget.isFavourite ? Icons.favorite : Icons.favorite_border,
          color: widget.isFavourite ? Colors.red[700] : Theme.of(context).colorScheme.primary,
          size: 30,
        ),
        onPressed: () async {
          if (widget.isFavourite) {
            await removeFromFavourite(context: context, house: widget.house);
            FavouritesProvider.setFavourites(context);
          } else {
            await addToFavourites(context: context, house: widget.house);
            FavouritesProvider.setFavourites(context);
          }
          setState(() {
            widget.isFavourite = !widget.isFavourite;
          });
        },
      ),
    );
  }
}
