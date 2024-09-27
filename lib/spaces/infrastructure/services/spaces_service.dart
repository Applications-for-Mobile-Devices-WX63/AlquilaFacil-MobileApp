import 'dart:convert';
import 'dart:io';
import 'package:alquilafacil/spaces/domain/model/space.dart';
import 'package:flutter/services.dart' show rootBundle;

class SpaceService {
  List<Space> spaces = [];

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/lib/public/data/fake_spaces_data.json';
  }

  Future<void> init() async {
    spaces = await loadSpaces();
  }

  Future<List<Space>> loadSpaces() async {
    try {
      String contents =
          await rootBundle.loadString('lib/public/data/fake_spaces_data.json');
      print(rootBundle.toString());
      List<dynamic> jsonData = json.decode(contents);
      return jsonData.map((space) => Space.fromJson(space)).toList();
    } catch (e) {
      print("Error al cargar el archivo JSON: $e");
      return [];
    }
  }

  Future<void> saveSpaces(List<Space> spaces) async {
    try {
      final path = await _getFilePath();
      final file = File(path);
      String jsonData =
          json.encode(spaces.map((space) => space.toJson()).toList());
      await file.writeAsString(jsonData);
    } catch (e) {
      print("Error al guardar el archivo JSON: $e");
    }
  }

  Future<void> addNewSpace(Space newSpace) async {
    List<Space> spaces = await loadSpaces();
    spaces.add(newSpace);
    await saveSpaces(spaces);
  }

  Future<Space?> getSpaceById(int id) async {
    try {
      List<Space> spaces = await loadSpaces();
      return spaces.firstWhere((space) => space.id == id,
          orElse: () => Space(
              id: -1,
              name: '',
              location: '',
              capacity: 0,
              description: '',
              price: 0,
              ownerId: -1));
    } catch (e) {
      print("Error al obtener el espacio por ID: $e");
      return null;
    }
  }
}
