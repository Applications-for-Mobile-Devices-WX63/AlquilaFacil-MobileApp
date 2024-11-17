import 'dart:convert';
import 'package:dio/dio.dart';

class NiubizServiceFacade {
  final String apiUrl = 'https://apisandbox.vnforappstest.com';

  final String username = 'integraciones@niubiz.com.pe';
  final String password = '_7z3@8fF';

  Future<String> createAccessToken() async {
    const url = 'https://apisandbox.vnforappstest.com/api.security/v1/security';
    final headers = {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$username:$password'))}',
      'Content-Type': 'application/json',
    };

    try {
      final response =
          await Dio().post(url, options: Options(headers: headers));
      if (response.statusCode == 201) {
        print('Access Token: ${response.data['accessToken']}');
        return response.data['accessToken'];
      } else {
        print('Error Response: ${response.data}');
        throw Exception(
            'Error al crear el token de acceso: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<String> createSessionToken(
      String accessToken, String merchantId, double amount) async {
    final String url =
        '$apiUrl/api.ecommerce/v2/ecommerce/token/session/$merchantId';

    final body = {
      "channel": "web",
      "amount": amount.toStringAsFixed(2),
      "antifraud": {
        'clientIp': '127.0.0.1',
        'merchantDefineData': {
          'MDD15': 'Valor MDD 15',
          'MDD20': 'Valor MDD 20',
        },
      },
      'dataMap': {
        'cardholderCity': 'Lima',
        'cardholderCountry': 'PE',
        'cardholderAddress': 'Av Jose Pardo 123',
        'cardholderPostalCode': '15000',
        'cardholderState': 'LIM',
        'cardholderPhoneNumber': '987654321',
      },
    };

    try {
      final response = await Dio().post(
        url,
        data: jsonEncode(body),
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Session Key: ${response.data['sessionKey']}');
        return response.data['sessionKey'];
      } else {
        print('Error Response: ${response.data}');
        throw Exception(
            'Error al crear token de sesión: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<String> getSessionKey(String merchantId, double amount) async {
    try {
      // Paso 1: Obtener el token de acceso
      final accessToken = await createAccessToken();

      // Paso 2: Crear el token de sesión usando el token de acceso
      final sessionKey =
          await createSessionToken(accessToken, merchantId, amount);

      return sessionKey;
    } catch (e) {
      print('Error en getSessionKey: $e');
      rethrow;
    }
  }
}
