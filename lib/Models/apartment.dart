import 'dart:io';

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
      area,
      governorate,
      city;
  List<String>? images = [];
  String? mainImage;
  bool? isFavourite, mine;
  Apartment({
    this.id,
    this.mainImage,
    this.description,
    this.category,
    this.isFavourite,
    this.mine,
    this.area,
    this.title,
    this.ownerId,
    this.images,
    this.bedrooms,
    this.bathrooms,
    this.livingRooms,
    this.price,
    this.city,
    this.governorate,
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
      city: data['city'],
      governorate: data['governorate'],
    );
  }
}
