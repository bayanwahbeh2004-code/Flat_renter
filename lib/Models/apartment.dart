import 'dart:io';

import 'package:baytech/Models/Location.dart';

class Apartment {
  String? id,
      title,
      description,
      ownerId,
      category,
      bedrooms,
      bathrooms,
      livingRooms,
      price,
      area;
  List<String>? images = [];
  String? mainImage;
  Location? location;
  bool? isFavourite;
  Apartment({
    this.id,
    this.mainImage,
    this.description,
    this.category,
    this.isFavourite,
    this.area,
    this.title,
    this.ownerId,
    this.images,
    this.bedrooms,
    this.bathrooms,
    this.livingRooms,
    this.price,
    this.location,
  });
  factory Apartment.fromJson(data) {
    return Apartment(
      id: data['id'].toString(),
      mainImage: data['mainImage'],
      area: data['area'],
      title: data['title'],
      ownerId: data['user_id'].toString(),
      bedrooms: data['bedrooms'].toString(),
      bathrooms: data['bathrooms'].toString(),
      livingRooms: data['livingrooms'].toString(),
      category: data['category'],
      price: data['day_price'].toString(),
      description: data['descreption'],
      location: Location.fromJson(data),
    );
  }
}
