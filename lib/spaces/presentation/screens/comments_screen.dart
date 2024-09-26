import 'package:alquilafacil/profile/domain/model/user.dart';
import 'package:alquilafacil/profile/infrastructure/services/users_service.dart';
import 'package:alquilafacil/public/presentation/widgets/screen_bottom_app_bar.dart';
import 'package:alquilafacil/spaces/domain/model/comment.dart';
import 'package:alquilafacil/spaces/presentation/widgets/space_comment.dart'; // Asegúrate de que esto esté bien importado
import 'package:alquilafacil/spaces/infrastructure/services/comments_service.dart';
import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  CommentsScreen({super.key});

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final CommentService commentService = CommentService();
  final UserService userService = UserService();
  List<Comment> comments = [];
  int? spaceId;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadComments();
  }

  Future<void> _loadComments() async {
    // Access the ModalRoute here
    final int id = ModalRoute.of(context)!.settings.arguments as int;
    setState(() {
      spaceId = id;
    });
    try {
      await commentService.init();
      await userService.init(); // Inicializa el UserService
      List<Comment> loadedComments = await commentService.getCommentsBySpaceId(spaceId!);
      setState(() {
        comments = loadedComments;
      });
    } catch (e) {
      // Manejo de errores al cargar comentarios
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar los comentarios: $e')),
      );
    }
  }

  Future<String> _getAuthorName(int authorId) async {
    User? user = await userService.getUserById(authorId);
    return user?.name ?? 'Desconocido'; // Retorna 'Desconocido' si no se encuentra el usuario
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comentarios'),
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orangeAccent,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: comments.map((comment) {
              return FutureBuilder<String>(
                future: _getAuthorName(comment.authorId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator(); // Muestra un indicador de carga
                  } else if (snapshot.hasError) {
                    return Text('Error al cargar el autor: ${snapshot.error}');
                  } else {
                    String authorName = snapshot.data ?? 'Desconocido';
                    return SpaceComment( // Asegúrate de que estás usando el widget correcto para mostrar comentarios
                      author: authorName,
                      text: comment.text,
                      rating: comment.rating,
                    );
                  }
                },
              );
            }).toList(),
          ),
        ),
      ),
      bottomNavigationBar: const ScreenBottomAppBar(),
    );
  }
}