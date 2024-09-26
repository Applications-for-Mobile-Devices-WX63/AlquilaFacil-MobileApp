import 'dart:convert';
import 'package:alquilafacil/reservation/model/reservation.dart';
import 'package:flutter/services.dart';

class ReservationService {
  List<Reservation> _reservations = [];

  Future<void> loadReservations() async {
    try {
      final String response = await rootBundle.loadString('assets/fake_reservations_data.json');
      final List<dynamic> data = jsonDecode(response);
      _reservations = data.map((json) => Reservation.fromJson(json)).toList();
    } catch (e) {
      // Manejo de errores al cargar los datos
      print('Error al cargar reservas: $e');
    }
  }

  List<Reservation> getReservations() {
    return _reservations;
  }

  List<Reservation> getReservationsBySpaceId(int spaceId) {
    return _reservations.where((reservation) => reservation.spaceId == spaceId).toList();
  }

  List<Reservation> getReservationsByUserId(int userId) {
    return _reservations.where((reservation) => reservation.userId == userId).toList();
  }
}