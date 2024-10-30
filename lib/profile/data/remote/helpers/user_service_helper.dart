import 'dart:convert';
import 'dart:io';

import 'package:alquilafacil/auth/data/remote/helpers/auth_service_helper.dart';
import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/profile/data/remote/service/user_service.dart';
import 'package:alquilafacil/profile/domain/model/profile.dart';
import 'package:dio/dio.dart';
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

  @override
  Future<Profile> createProfile(String email, String password, String name, String fatherName, String motherName, String documentNumber, String dateOfBirth, String phoneNumber) async {
    final dio = Dio();
    final signInService = AuthServiceHelper();
    var token = signInProvider.token;
    int userId;

    try {
      final signInResponse = await signInService.signIn(email, password);
      userId = signInResponse["id"];
      token = signInResponse["token"];
      final profileToAdd = Profile(
        id: 0,
        name: name,
        phoneNumber: phoneNumber,
        fatherName: fatherName,
        motherName: motherName,
        userId: userId,
        documentNumber: documentNumber,
        dateOfBirth: dateOfBirth,
      ).toJson();

      Logger().d(profileToAdd);
      final options = Options(headers: {'Authorization': 'Bearer $token'});
      final request = await dio.post(
        "${Constant.BASE_URL}${Constant.RESOURCE_PATH}profiles",
        data: profileToAdd,
        options: options,
      );
      if (request.statusCode == HttpStatus.created) {
        final json = request.data;
        final profile = Profile.fromJson(json);
        return profile;
      } else {
        throw Exception(errorMessageHandler.reject(request.statusCode!));
      }
    } catch (e) {
      Logger().e("Error while creating profile: $e");
      rethrow;
    }
  }


}