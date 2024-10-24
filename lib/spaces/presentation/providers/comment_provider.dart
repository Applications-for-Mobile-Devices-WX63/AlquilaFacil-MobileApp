import 'package:alquilafacil/profile/presentation/providers/pofile_provider.dart';
import 'package:alquilafacil/spaces/data/remote/helpers/comment_service_helper.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/model/comment.dart';

class CommentProvider extends ChangeNotifier{
  final CommentServiceHelper commentService;
  CommentProvider(this.commentService);

  List<Comment> comments = [];
  List<String> authors = [];

  Future<void> getAllCommentsBySpaceId(int spaceId)async {
    try{
      comments = await commentService.getAllCommentsBySpaceId(spaceId);
    }catch(e){
      comments = [];
    }
    notifyListeners();
  }

}