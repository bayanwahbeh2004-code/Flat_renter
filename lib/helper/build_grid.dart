import 'package:baytech/Models/apartment.dart';
import 'package:baytech/components/appartmentProfileImage.dart';
import 'package:flutter/material.dart';

Widget buildGrid(List<Apartment> data) {
  return GridView.builder(
    itemCount: data.length,
    clipBehavior: Clip.hardEdge,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      mainAxisSpacing: 10,
    ),
    itemBuilder: (context, index) {
      return AppartmentProfileImage(
        apartment: data[index],
        height: 80,
        width: 50,
      );
    },
  );
}
