class Space {
  final int id;
  final String streetAddress;
  final String district;
  final String localName;
  final String cityPlace;
  final String country;
  final double nightPrice;
  final String photoUrl;
  final String descriptionMessage;
  final int localCategoryId;
  late final int userId;
  final String features;
  final int capacity;

  Space({
    required this.id,
    required this.streetAddress,
    required this.localName,
    required this.cityPlace,
    required this.nightPrice,
    required this.photoUrl,
    required this.descriptionMessage,
    required this.localCategoryId,
    required this.userId,
    required this.features,
    required this.capacity,
    this.district = ' ',
    this.country = ' ',
  });

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id: json['id'],
      streetAddress: json['streetAddress'],
      localName: json['localName'],
      cityPlace: json['cityPlace'],
      nightPrice: json['nightPrice'].toDouble(),
      photoUrl: json['photoUrl'],
      descriptionMessage: json['descriptionMessage'],
      localCategoryId: json['localCategoryId'],
      userId: json['userId'],
      features: json['features'],
      capacity: json['capacity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'district': district,
      'street': streetAddress,
      'localName': localName,
      'country': country,
      'city': cityPlace,
      'price': nightPrice.toInt(),
      'photoUrl': photoUrl,
      'descriptionMessage': descriptionMessage,
      'localCategoryId': localCategoryId,
      'userId': userId,
      'features': features,
      'capacity': capacity,
    };
  }
}