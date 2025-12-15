class Filter {
  String? city,
      governorate,
      title,
      category,
      minPrice,
      maxPrice,
      minarea,
      maxarea,
      minBathroom,
      maxBathroom,
      minLivingRoom,
      maxLivingRoom,
      minBedroom,
      maxBedroom,
      description;
  bool isEmpty() {
    return title == null &&
        city == null &&
        governorate == null &&
        minPrice == null &&
        maxPrice == null &&
        minarea == null &&
        maxarea == null &&
        minBathroom == null &&
        maxBathroom == null &&
        minLivingRoom == null &&
        maxLivingRoom == null &&
        minBedroom == null &&
        maxBedroom == null &&
        description == null;
  }

  Filter({
    this.city,
    this.title,
    this.category,
    this.governorate,
    this.maxBathroom,
    this.maxBedroom,
    this.maxLivingRoom,
    this.maxPrice,
    this.maxarea,
    this.minBathroom,
    this.minBedroom,
    this.minLivingRoom,
    this.minPrice,
    this.minarea,
  });
}
