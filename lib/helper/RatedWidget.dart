import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rated extends StatefulWidget {
  String currentRating = '0';
  Rated({super.key, required this.currentRating});

  @override
  State<Rated> createState() => _RatedState();
}

class _RatedState extends State<Rated> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar.builder(
        initialRating: double.parse(widget.currentRating),
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 32,
        ignoreGestures: true,
        itemBuilder: (context, _) =>
            Icon(Icons.star, color: Theme.of(context).colorScheme.secondary),
        onRatingUpdate: (_) {},
      ),
    );
  }
}
