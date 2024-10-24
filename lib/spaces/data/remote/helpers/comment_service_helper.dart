import 'dart:convert';
import 'dart:io';

import 'package:alquilafacil/spaces/domain/model/comment.dart';
import 'package:logger/logger.dart';

import '../../../../auth/presentation/providers/SignInPovider.dart';
import '../../../../shared/constants/constant.dart';
import '../../../../shared/handlers/concrete_response_message_handler.dart';
import '../services/comments_service.dart';

class CommentServiceHelper extends CommentService{
  final SignInProvider signInProvider;
  var errorMessageHandler = ConcreteResponseMessageHandler();
  var logger = Logger();
  CommentServiceHelper(this.signInProvider);

  @override
  Future<List<Comment>> getAllCommentsBySpaceId(int spaceId) async {
    var client = HttpClient();
    try{
      var url = Uri.parse("${Constant.BASE_URL}${Constant.RESOURCE_PATH}comment/local/$spaceId");
      var token = signInProvider.token;
      var request = await client.getUrl(url);
      request.headers.set(HttpHeaders.authorizationHeader, "Bearer $token");
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var responseBody = await response.transform(utf8.decoder).join();
        var json = jsonDecode(responseBody);
        final List<dynamic> comments = json;
        logger.v(comments);
        return comments.map((comment) => Comment.fromJson(comment)).toList();
      } else {
        throw Exception(errorMessageHandler.reject(response.statusCode));
      }
    } catch (e) {
      logger.e("Error while trying to fetch comments");
      logger.v(e);
      return [];

    } finally {
      client.close();
    }
  }
}