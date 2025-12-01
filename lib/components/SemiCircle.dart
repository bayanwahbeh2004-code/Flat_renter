import 'dart:ui';
import 'package:flutter/material.dart';

class Semicircle extends StatelessWidget {
  double width, height, radius_for_the_circle;
  Semicircle({
    super.key,
    required this.height,
    required this.width,
    required this.radius_for_the_circle,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(radius_for_the_circle, 100),
                ),
              ),
            ),
          ),
        ),
        Expanded(child: Container(color: Colors.white)),
      ],
    );
  }
}
