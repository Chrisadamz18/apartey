class ApartmentModel {
  String? type;
  String? description;
  String? image;
  String? location;
  double? price;
  // String? id;

  ApartmentModel({
    this.type,
    this.description,
    this.image,
    this.location,
    this.price,
    // this.id,
  });

//Receiving data from the server
  factory ApartmentModel.fromMap(map) {
    return ApartmentModel(
      // id: map['id'],
      description: map['description'],
      location: map['location'],
      price: map['price'],
      image: map['image'],
      type: map['type'],
    );
  }
}
