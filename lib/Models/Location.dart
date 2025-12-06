class Location {
  String? town,city;
  Location({
    this.town,
    this.city,
  });
  factory Location.fromJson(Map<String, dynamic> data){
    return Location(
      town: data['town'],
      city: data['city'],
    );
  }
}