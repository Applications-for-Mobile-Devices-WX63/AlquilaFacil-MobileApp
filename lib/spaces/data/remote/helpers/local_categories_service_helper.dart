import 'dart:convert';
import 'dart:io';

import 'package:alquilafacil/auth/presentation/providers/SignInPovider.dart';
import 'package:alquilafacil/shared/handlers/concrete_response_message_handler.dart';
import 'package:alquilafacil/spaces/data/remote/services/local_categories_service.dart';
import 'package:logger/logger.dart';

import '../../../../shared/constants/constant.dart';
import '../../../domain/model/local_category.dart';

class LocalCategoriesServiceHelper extends LocalCategoriesService {
  final SignInProvider signInProvider;
  var errorMessageHandler = ConcreteResponseMessageHandler();
  LocalCategoriesServiceHelper(this.signInProvider);
  var logger = Logger();
  @override
  Future<List<LocalCategory>> getAllLocalCategories() async {
    var client = HttpClient();
    try {
      var url = Uri.parse("${Constant.BASE_URL}${Constant.RESOURCE_PATH}local-categories");
      var token = signInProvider.token;
      var request = await client.getUrl(url);
      request.headers.set(HttpHeaders.authorizationHeader, "Bearer $token");
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        var json = jsonDecode(responseBody);
        final List<dynamic> localCategories = json;
        return localCategories.map((localCategory) => LocalCategory.fromJson(localCategory)).toList();
      } else {
        throw Exception(errorMessageHandler.reject(response.statusCode));
      }
    } catch (e) {
      print('Error: $e');
      return [];
    } finally {
      client.close();
    }
  }
}