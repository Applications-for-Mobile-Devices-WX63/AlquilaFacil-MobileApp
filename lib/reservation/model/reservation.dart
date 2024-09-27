class Reservation {
  final int id;
  final int userId;
  final int spaceId;
  final String date;
  final String startTime;
  final String endTime;

  Reservation({
    required this.id,
    required this.userId,
    required this.spaceId,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  // Método para crear un objeto Reservation desde un JSON
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] as int,
      userId: json['userId'] as int,
      spaceId: json['spaceId'] as int,
      date: json['date'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );
  }

  // Método para convertir un objeto Reservation a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'spaceId': spaceId,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}