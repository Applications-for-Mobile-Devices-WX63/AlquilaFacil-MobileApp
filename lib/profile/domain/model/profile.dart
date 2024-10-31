class Profile {
  final int id;
  final String name;
  final String fatherName;
  final String motherName;
  final String documentNumber;
  final String dateOfBirth;
  final String phoneNumber;
  final int userId;
  Profile({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.fatherName,
    required this.motherName,
    required this.userId,
    required this.documentNumber,
    required this.dateOfBirth,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'fatherName': fatherName,
      'motherName': motherName,
      'phone': phoneNumber,
      'documentNumber': documentNumber,
      'dateOfBirth': dateOfBirth,
      'userId': userId
    };
  }

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      phoneNumber: json['phone'],
      name: json['fullName'].split(" ")[0],
      fatherName: json['fullName'].split(" ")[1],
      motherName: json['fullName'].split(" ")[2],
      documentNumber: json['documentNumber'],
      dateOfBirth: json['dateOfBirth'],
      userId: json['userId']
    );
  }
}