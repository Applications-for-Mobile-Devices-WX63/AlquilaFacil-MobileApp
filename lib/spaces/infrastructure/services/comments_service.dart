import 'dart:convert';
import 'dart:io';
import 'package:alquilafacil/spaces/domain/model/comment.dart';
import 'package:flutter/services.dart' show rootBundle;

class CommentService {
  List<Comment> comments = [];

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/lib/public/data/fake_comments_data.json';
  }

  Future<void> init() async {
    comments = await loadComments();
  }

  Future<List<Comment>> loadComments() async {
    try {
      String contents = await rootBundle
          .loadString('lib/public/data/fake_comments_data.json');
      List<dynamic> jsonData = json.decode(contents);
      return jsonData.map((comment) => Comment.fromJson(comment)).toList();
    } catch (e) {
      print("Error al cargar el archivo JSON: $e");
      return [];
    }
  }

  Future<void> saveComments(List<Comment> comments) async {
    try {
      final path = await _getFilePath();
      final file = File(path);
      String jsonData =
          json.encode(comments.map((comment) => comment.toJson()).toList());
      await file.writeAsString(jsonData);
    } catch (e) {
      print("Error al guardar el archivo JSON: $e");
    }
  }

  Future<void> addNewComment(Comment newComment) async {
    List<Comment> comments = await loadComments();
    comments.add(newComment);
    await saveComments(comments);
  }

  Future<Comment?> getCommentById(int id) async {
    try {
      List<Comment> comments = await loadComments();
      return comments.firstWhere((comment) => comment.id == id,
          orElse: () =>
              Comment(id: -1, authorId: -1, spaceId: -1, text: '', rating: 0));
    } catch (e) {
      print("Error al obtener el comentario por ID: $e");
      return null;
    }
  }

  Future<List<Comment>> getCommentsBySpaceId(int spaceId) async {
    try {
      List<Comment> comments = await loadComments();
      return comments.where((comment) => comment.spaceId == spaceId).toList();
    } catch (e) {
      print("Error al obtener comentarios por spaceId: $e");
      return [];
    }
  }
}
