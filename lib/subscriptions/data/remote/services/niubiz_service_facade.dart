import 'dart:convert';
import 'dart:io';

import 'package:alquilafacil/shared/handlers/concrete_response_message_handler.dart';
import 'package:dio/dio.dart';

class NiubizServiceFacade{
  final String apiUrl = 'https://apisandbox.vnforappstest.com/api.security/v1';
  final String accessToken = 'YOUR_ACCESS_TOKEN';
  final errorMessageHandler = ConcreteResponseMessageHandler();
  Future<void> createPayment({
    required String orderId,
    required double amount,
    required String currency,
  }) async {
    final url =  '$apiUrl/security';
    final options = Options(headers: {'Authorization': 'Bearer $accessToken'});
    final body = jsonEncode({
      "order": {
        "purchaseNumber": orderId,
        "amount": amount,
        "currency": currency,
      },
    });
    final request = Dio();
    final response = await request.post(url,data: body,options:options );
    if(response.statusCode == HttpStatus.ok){
      return;
    }else{
      throw Exception(errorMessageHandler.reject(response.statusCode!));
    }

  }
}