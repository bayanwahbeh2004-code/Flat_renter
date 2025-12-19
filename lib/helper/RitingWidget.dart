import 'package:baytech/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Ritingwidget extends StatefulWidget {
  const Ritingwidget({super.key});

  @override
  State<Ritingwidget> createState() => _RitingwidgetState();
}

class _RitingwidgetState extends State<Ritingwidget> {
  double currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RatingBar.builder(
          initialRating: 0,
          minRating: 0,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 32,
          // itemPadding: const EdgeInsets.symmetric(horizontal: 0),
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: KPurple),
          onRatingUpdate: (rating) {
            currentRating = rating;
          },
        ),
      ),
    );
  }
}
