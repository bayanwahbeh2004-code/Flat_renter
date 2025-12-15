class Location {
  String? governorate, city;
  Location({this.governorate, this.city});
  factory Location.fromJson(Map<String, dynamic> data) {
    return Location(governorate: data['governorate'], city: data['city']);
  }
}
