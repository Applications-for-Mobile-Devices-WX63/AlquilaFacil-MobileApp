import '../../../domain/model/reservation.dart';

abstract class ReservationService{
  Future<void> createReservation(int userId, int localId, String startDate, String endDate);
}