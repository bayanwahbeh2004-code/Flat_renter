import 'package:baytech/Models/apartment.dart';
import 'package:baytech/helper/show_dialoge.dart';
import 'package:baytech/services/houses/adding_houses/add_images.dart';
import 'package:baytech/services/houses/deleting_houses/delete_house.dart';
import 'package:baytech/services/houses/deleting_houses/delete_image.dart';
import 'package:baytech/services/houses/update_house/update_house.dart';
import 'package:flutter/material.dart';

Future<bool> updateToCall({
  required Apartment house,
  required String mainImage,
  required List<String> images,
  required BuildContext context,
}) async {
  bool deleted = await deleteImages(context: context, house: house);
  bool added = false;
  if (deleted)
    added = await addImages(house: house, images: images, context: context);
  bool ok = false;
  if (added) ;
  /* ok = await updateHouse(
      context: context,
      house: house,
      mainImage: mainImage,
    );*/
  return ok;
}
