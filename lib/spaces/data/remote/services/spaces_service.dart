import 'dart:collection';
import 'dart:io';
import 'package:alquilafacil/spaces/domain/model/space.dart';

abstract class SpaceService{
  Future<List<Space>> getAllSpaces();
  Future<HashSet<String>> getAllDistricts();
  Future<String> uploadImage(File image);
  Future<String> createSpace(Space space);
}