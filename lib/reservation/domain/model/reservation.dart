class Reservation {
  final int id;
  final int userId;
  final int spaceId;
  final DateTime startDate;
  final DateTime endDate;

  Reservation({
    required this.id,
    required this.userId,
    required this.spaceId,
    required this.startDate,
    required this.endDate,
  });

  // Método para crear un objeto Reservation desde un JSON
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] as int,
      userId: json['userId'] as int,
      spaceId: json['localId'] as int,
      startDate: json['date'] as DateTime,
      endDate: json['startTime'] as DateTime,
    );
  }

  // Método para convertir un objeto Reservation a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'localId': spaceId,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}