import 'package:baytech/Models/apartment.dart';
import 'package:baytech/components/appartmentProfileImage.dart';
import 'package:flutter/material.dart';

Widget buildGrid(List<Apartment> data, bool mine) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: GridView.builder(
      itemCount: data.length,
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.hardEdge,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        data[index].mine = mine;
        return AppartmentProfileImage(
          house: data[index],
          heigth: 300,
          width: 200,
        );
      },
    ),
  );
}
