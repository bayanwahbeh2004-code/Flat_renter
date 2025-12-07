import 'dart:io';

import 'package:baytech/Models/Location.dart';

class Apartment {
  String? title, description, ownerId, category,bedrooms, bathrooms, livingRooms,price, area;
  List<File>? images = [];
  List <String>? reviews = [];
  File? mainImage;
  Location? location;
  Apartment({
    this.mainImage,
    this.description,
    this.category,
    this.area,
    this.title,
    this.ownerId,
    this.images,
    this.reviews,
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
      ownerId: data['ownerId'],
      images: List<File>.from(data['images']),
      reviews: List<String>.from(data['reviews']),
      bedrooms: data['bedrooms'],
      bathrooms: data['bathrooms'],
      livingRooms: data['livingRooms'],
      price: data['price'].toDouble(),
      location: Location.fromJson(data['location']),
    );
  }
}
