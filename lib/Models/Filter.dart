class Filter {
  late List <String> city;
  late List <String> governorate;
  late String minPrice;
  late String maxPrice;
  late String minarea;
  late String maxarea;
  late String minBathroom;
  late String maxBathroom;
  late String minLivingRoom;
  late String maxLivingRoom;
  late String minBedroom;
  late String maxBedroom;
  Filter({required this.city,
  required this.governorate,
  required this.maxBathroom,
  required this.maxBedroom,
  required this.maxLivingRoom,
  required this.maxPrice,
  required this.maxarea,
  required this.minBathroom,
  required this.minBedroom,
  required this.minLivingRoom,
  required this.minPrice,
  required this.minarea});
}