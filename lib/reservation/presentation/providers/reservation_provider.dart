import 'package:alquilafacil/reservation/domain/model/reservation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../data/remote/helpers/reservation_service_helper.dart';

class ReservationProvider extends ChangeNotifier{
  final ReservationServiceHelper reservationService;
  List<Reservation> reservations = [];

  ReservationProvider(this.reservationService);
  Future<void> createReservation(int userId, int localId, String startDate, String endDate) async{
    await reservationService.createReservation(userId, localId, startDate, endDate);
    notifyListeners();
  }

  Future<void> getReservationsByUserId(int userId) async{
    try {
      reservations = await reservationService.getReservationsByUserId(userId);
    } catch (e){
      reservations = [];
    }
    notifyListeners();
  }
}