import 'package:alquilafacil/spaces/domain/model/local_category.dart';

abstract class LocalCategoriesService{
  Future<List<LocalCategory>> getAllLocalCategories();
}