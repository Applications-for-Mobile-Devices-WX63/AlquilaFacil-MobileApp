
import 'dart:io';

import 'package:alquilafacil/spaces/data/remote/helpers/space_service_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../domain/model/space.dart';

class SpaceProvider extends ChangeNotifier{
  final SpaceServiceHelper spaceService;
  List<Space> spaces = [];
  List<Space> currentSpaces = [];
  List<String> districts = [];
  String cityPlace= "";
  String spacePhotoUrl = "";
  var logger = Logger();
  SpaceProvider(this.spaceService);

  Future<void> getAllSpaces() async{
    try{
      spaces = await spaceService.getAllSpaces();
    } catch (e){
      spaces = [];
    }
    notifyListeners();
  }

  void setCityPlace(newCityPlace){
    cityPlace = newCityPlace;
    notifyListeners();
  }


  void searchSpaceByName()  {
    currentSpaces= spaces.where((space) => space.streetAddress.toLowerCase().contains(cityPlace.toLowerCase())).toList();
    notifyListeners();
  }

  Future<void> getAllDistricts() async {
    try {
      var districtsResponse = await spaceService.getAllDistricts();
      districts = districtsResponse.toList();
    } catch (e){
      logger.e("Error while trying to fetch spaces districts, please check the service request");
    }
    notifyListeners();
  }

  Future<void> uploadImage(File image) async {
    try {
      spacePhotoUrl = await spaceService.uploadImage(image);
    } catch (e){
      logger.e("Error while trying to upload image, please check the service request", e);
    }
    notifyListeners();
  }

  Future<void> createSpace(Space space) async {
    try {
      logger.i("Creating space with the following data: $space");
      await spaceService.createSpace(space);
    } catch (e){
      logger.e("Error while trying to create space, please check the service request", e);
    }
    notifyListeners();
  }
}