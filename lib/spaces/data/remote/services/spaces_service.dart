
import 'dart:collection';

import 'package:alquilafacil/spaces/domain/model/space.dart';

abstract class SpaceService{
  Future<List<Space>> getAllSpaces();
  Future<HashSet<String>>  getAllDistricts();
  Future<List<Space>> getAllSpacesByCategoryIdAndCapacityRange(int categoryId, int minRange, int maxRange);
}