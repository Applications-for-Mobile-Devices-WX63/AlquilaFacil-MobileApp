import 'dart:convert';
import 'dart:io';
import 'package:alquilafacil/profile/domain/model/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;


class UserService {
  List<User> users = [];

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/lib/public/data/fake_users_data.json'; // Ruta donde se guardará el archivo JSON
  }

  Future<void> init() async {
    users = await loadUsers();
  }

  Future<List<User>> loadUsers() async {
    try {
      String contents = await rootBundle.loadString('lib/public/data/fake_users_data.json');
      List<dynamic> jsonData = json.decode(contents);
      return jsonData.map((user) => User.fromJson(user)).toList();
    } catch (e) {
      print("Error al cargar el archivo JSON: $e");
      return [];
    }
  }

  Future<void> saveUsers(List<User> users) async {
    try {
      final path = await _getFilePath();
      final file = File(path);
      String jsonData = json.encode(users.map((user) => user.toJson()).toList());
      await file.writeAsString(jsonData);
    } catch (e) {
      print("Error al guardar el archivo JSON: $e");
    }
  }

  Future<void> addNewUser(User newUser) async {
    List<User> users = await loadUsers();
    users.add(newUser);
    await saveUsers(users);
  }

  Future<User?> getUserById(int id) async {
    try {
      List<User> users = await loadUsers();
      return users.firstWhere((user) => user.id == id, orElse: () => User(id: -1, name: '', email: '', phoneNumber: ''));
    } catch (e) {
      print("Error al obtener el usuario por ID: $e");
      return null;
    }
  }
}