class Space {
  final int id;
  final String name;
  final String location;
  final int capacity;
  final String description;
  final double price;
  final int ownerId;

  Space({
    required this.id,
    required this.name,
    required this.location,
    required this.capacity,
    required this.description,
    required this.price,
    required this.ownerId,
  });

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      capacity: json['capacity'],
      description: json['description'],
      price: json['price'],
      ownerId: json['ownerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'capacity': capacity,
      'description': description,
      'price': price,
      'ownerId': ownerId,
    };
  }
}