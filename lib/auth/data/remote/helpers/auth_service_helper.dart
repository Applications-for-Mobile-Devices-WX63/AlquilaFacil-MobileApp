import 'dart:convert';
import 'dart:io';

import 'package:alquilafacil/auth/data/remote/services/auth_service.dart';
import 'package:alquilafacil/shared/constants/constant.dart';
import 'package:alquilafacil/shared/handlers/concrete_response_message_handler.dart';

class AuthServiceHelper extends AuthService{
  var messageHandler = ConcreteResponseMessageHandler();
  @override
  Future<String> signIn(String email, String password) async {
    var client = HttpClient();
    try {
      var url = Uri.parse(Constant.getEndpoint("authentication", "/sign-in"));
      var request = await client.postUrl(url);
      request.headers.set(HttpHeaders.contentTypeHeader, "application/json");
      var requestBody = jsonEncode({
        "email": email,
        "password": password
      });
      request.add(utf8.encode(requestBody));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        var token = jsonDecode(responseBody)["token"];
        return token;
      } else {
        throw Exception(messageHandler.reject(response.statusCode));
      }
    } finally {
      client.close();
    }
  }


  @override
  Future<String> signUp(String username, String password, String email) async {
    var client = HttpClient();
    try {
      var url = Uri.parse(Constant.getEndpoint("authentication", "/sign-up"));
      var request = await client.postUrl(url);
      request.headers.set(HttpHeaders.contentTypeHeader,"application/json");
      var requestBody = jsonEncode({
        "username": username,
        "password": password,
        "email": email
      });
      request.add(utf8.encode(requestBody));
      var response = await request.close();
      if(response.statusCode == HttpStatus.ok){
        var responseBody = await response.transform(utf8.decoder).join();
        var successMessage = jsonDecode(responseBody)["message"];
        return successMessage;
      } else {
        throw Exception(messageHandler.reject(response.statusCode));
      }
    } finally {
      client.close();
    }
  }

}