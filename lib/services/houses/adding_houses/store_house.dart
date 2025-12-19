import 'dart:convert';
import 'package:baytech/Models/apartment.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/services/houses/adding_houses/add_house.dart';
import 'package:baytech/services/houses/adding_houses/add_images.dart';
import 'package:baytech/services/houses/deleting_houses/delete_house.dart';
import 'package:flutter/material.dart';

Future<bool> storeHouse({
  required Apartment house,
  required List<String> images,
  required BuildContext context,
}) async {
  Apartment successfullyAdded = await addHouse(house: house, context: context);
  if (successfullyAdded.id != null) {
    if (images.isNotEmpty) {
      bool added = await addImages(
        house: successfullyAdded,
        images: images,
        context: context,
      );
      if (added == false) {
        await deleteHouse(context: context, house: successfullyAdded);
        return false;
      }
      return added;
    } else {
      showDialoge(
        context,
        child: Text(
          'Property photos field is required, please upload at least one picture',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      );
      await deleteHouse(context: context, house: successfullyAdded);
      return false;
    }
  } else {
    return false;
  }
}
