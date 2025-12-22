import 'dart:io';

import 'package:baytech/Models/apartment.dart';

class Book {
  String? id,
      first_name,
      last_name,
      personal_photo,
      start_date,
      end_date,
      total_price,
      price_diff;
  Apartment? house;
  Book({
    this.id,
    this.first_name,
    this.last_name,
    this.start_date,
    this.end_date,
    this.personal_photo,
    this.house,
    this.total_price,
    this.price_diff,
  });
  factory Book.fromJson(json) {
    dynamic data = json['Book'];
    return Book(
      id: data['id'].toString(),
      first_name: data["first_name"],
      last_name: data["last_name"],
      personal_photo: data["personal_photo"],
      start_date: data["start_date"],
      end_date: data["end_date"],
      total_price: data["total_price"].toString(),
      house: data['House'] == null
          ? Apartment()
          : Apartment.fromJson(data['House']),
      price_diff: data['price_difference']?.toString(),
    );
  }
}
