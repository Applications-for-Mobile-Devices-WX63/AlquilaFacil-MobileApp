import 'dart:convert';
import 'dart:io';

import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/profile/data/remote/service/user_service.dart';
import 'package:logger/logger.dart';

import '../../../../shared/constants/constant.dart';
import '../../../../shared/handlers/concrete_response_message_handler.dart';

class UserServiceHelper extends UserService{
  var errorMessageHandler = ConcreteResponseMessageHandler();
  final SignInProvider signInProvider;
  UserServiceHelper(this.signInProvider);
  @override
  Future<String> getUsernameByUserId(int userId) async {
    var client = HttpClient();
    try{
      var url = Uri.parse(Constant.getEndpoint("users/", "get-username/$userId"));
      var request = await client.getUrl(url);
      var token = signInProvider.token;
      request.headers.set(HttpHeaders.authorizationHeader, "Bearer $token");
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok){
        var responseBody = await response.transform(utf8.decoder).join();
        var json = jsonDecode(responseBody);
        final String username = json;
        Logger().i("Username caught: $username");
        return username;
      } else {
        Logger().e("An error has ocurred, userId found $userId");
        throw Exception(errorMessageHandler.reject(response.statusCode));
      }
    } finally{
      client.close();
    }
  }

}