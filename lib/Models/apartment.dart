import 'package:baytech/Models/Location.dart';

class Apartment {
  String? title,description, ownerId, category;
  List<String>? images=[], reviews=[];
  int? bedrooms, bathrooms, livingRooms;
  double? price, area;
  Location? location;
  Apartment({
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
  factory Apartment.fromJson(Map<String, dynamic> data) {
    return Apartment(
      area: data['area'],
      title: data['title'],
      ownerId: data['ownerId'],
      images: List<String>.from(data['images']),
      reviews: List<String>.from(data['reviews']),
      bedrooms: data['bedrooms'],
      bathrooms: data['bathrooms'],
      livingRooms: data['livingRooms'],
      price: data['price'].toDouble(),
      location: Location.fromJson(data['location']),
    );
  }
}
