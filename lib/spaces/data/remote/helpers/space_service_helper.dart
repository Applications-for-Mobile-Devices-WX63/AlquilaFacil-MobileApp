import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/shared/handlers/concrete_response_message_handler.dart';
import 'package:alquilafacil/spaces/data/remote/services/spaces_service.dart';
import 'package:logger/logger.dart';

import '../../../../shared/constants/constant.dart';
import '../../../domain/model/space.dart';

class SpaceServiceHelper extends SpaceService{
  final SignInProvider signInProvider;
  var errorMessageHandler = ConcreteResponseMessageHandler();
  var logger = Logger();
  SpaceServiceHelper(this.signInProvider);
  @override
  Future<List<Space>> getAllSpaces() async {
    var client = HttpClient();
    try{
      var url = Uri.parse("${Constant.BASE_URL}${Constant.RESOURCE_PATH}locals");
      var token = signInProvider.token;
      logger.i("Current token: $token");
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

  @override
  Future<HashSet<String>> getAllDistricts() async {
    var client = HttpClient();
    try{
      var url = Uri.parse("${Constant.BASE_URL}${Constant.RESOURCE_PATH}locals/get-all-districts");
      var token = signInProvider.token;
      logger.i("Current token: $token");
      var request = await client.getUrl(url);
      request.headers.set(HttpHeaders.authorizationHeader, "Bearer $token");
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok){
        var responseBody = await response.transform(utf8.decoder).join();
        final List<dynamic> districts = jsonDecode(responseBody);
        final HashSet<String> districtsResponse = HashSet<String>.from(districts.map((district) => district.toString()));
        return districtsResponse;
      } else {
        throw Exception(errorMessageHandler.reject(response.statusCode));
      }
    } finally{
      client.close();
    }
  }



}