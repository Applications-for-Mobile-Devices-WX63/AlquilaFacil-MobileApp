import 'dart:convert';
import 'dart:io';

import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/shared/handlers/concrete_response_message_handler.dart';
import 'package:alquilafacil/spaces/data/remote/services/spaces_service.dart';

import '../../../../shared/constants/constant.dart';
import '../../../domain/model/space.dart';

class SpaceServiceHelper extends SpaceService{
  var signInProvider = SignInProvider();
  var errorMessageHandler = ConcreteResponseMessageHandler();
  @override
  Future<List<Space>> getAllSpaces() async {
    var client = HttpClient();
    try{
      var url = Uri.parse("${Constant.BASE_URL}${Constant.RESOURCE_PATH}locals");
      var token = signInProvider.token;
      var request = await client.getUrl(url);
      request.headers.set(HttpHeaders.authorizationHeader, "Bearer $token");
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok){
        var responseBody = await response.transform(utf8.decoder).join();
        var json = jsonDecode(responseBody);
        final List<dynamic> spaces = json;
        return spaces.map((space) => Space.fromJson(space)).toList();
      } else{
        throw Exception(errorMessageHandler.reject(response.statusCode));
      }
    } finally{
      client.close();
    }
  }



}