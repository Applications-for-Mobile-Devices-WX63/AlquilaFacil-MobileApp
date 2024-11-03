import 'dart:convert';
import 'dart:io';

import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/reservation/data/remote/services/reservation_service.dart';
import 'package:alquilafacil/reservation/domain/model/reservation.dart';
import 'package:alquilafacil/shared/handlers/concrete_response_message_handler.dart';
import 'package:logger/logger.dart';

import '../../../../shared/constants/constant.dart';

class ReservationServiceHelper extends ReservationService{
  var errorMessageHandler = ConcreteResponseMessageHandler();
  final SignInProvider signInProvider;
  ReservationServiceHelper(this.signInProvider);

  @override
  Future<void> createReservation(int userId, int localId, String startDate, String endDate) async {
    var client = HttpClient();
    try {
      var url = Uri.parse("${Constant.BASE_URL}${Constant.RESOURCE_PATH}reservation");
      var token = signInProvider.token;
      var request = await client.postUrl(url);
      request.headers.set(HttpHeaders.authorizationHeader,"Bearer $token");
      request.headers.set(HttpHeaders.contentTypeHeader,"application/json");
      var requestBody = jsonEncode({
        "startDate": startDate,
        "endDate": endDate,
        "userId": userId,
        "localId": localId
      });
      request.add(utf8.encode(requestBody));
      Logger().i("$userId, $localId, $startDate, $endDate");
      var response = await request.close();
      if (response.statusCode == HttpStatus.created){
        Logger().i("Reservation added");
      }else{
        throw Exception("${errorMessageHandler.reject(response.statusCode)} ${response.statusCode}");
      }

    } finally{
      client.close();
    }
  }

  @override
  Future<List<Reservation>> getReservationsByUserId(int userId) async {
    var client = HttpClient();
    try {
      var url = Uri.parse("${Constant.BASE_URL}${Constant.RESOURCE_PATH}reservation/by-user-id/$userId");
      var token = signInProvider.token;
      var request = await client.getUrl(url);
      request.headers.set(HttpHeaders.authorizationHeader, "Bearer $token");
      var response = await request.close();
      if(response.statusCode == HttpStatus.ok){
        var responseBody = await response.transform(utf8.decoder).join();
        final List<dynamic> reservations =jsonDecode(responseBody);
        return reservations.map((reservation) => Reservation.fromJson(reservation)).toList();
      }
      else {
        throw Exception(errorMessageHandler.reject(response.statusCode));
      }
    } finally {
      client.close();
    }
  }

}