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
  Apartment({
    this.mainImage,
    this.description,
    this.category,
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
      mainImage: data['mainImage'],
      area: data['area'],
      title: data['title'],
      ownerId: data['user_id'],
      bedrooms: data['bedrooms'],
      bathrooms: data['bathrooms'],
      livingRooms: data['livingrooms'],
      category: data['category'],
      price: data['day_price'],
      location: Location.fromJson(data['location']),
    );
  }
}
