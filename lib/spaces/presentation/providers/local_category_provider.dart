import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../data/remote/helpers/local_categories_service_helper.dart';
import '../../domain/model/local_category.dart';

class LocalCategoryProvider extends ChangeNotifier{
  final LocalCategoriesServiceHelper localCategoriesService;
  LocalCategoryProvider(this.localCategoriesService);
  List<LocalCategory> localCategories = [];

  Future<void> getAllLocalCategories() async{
    try{
      localCategories = await localCategoriesService.getAllLocalCategories();
      Logger().i(localCategories);
    } catch (e){
      localCategories = [];
    }
    notifyListeners();
  }
}