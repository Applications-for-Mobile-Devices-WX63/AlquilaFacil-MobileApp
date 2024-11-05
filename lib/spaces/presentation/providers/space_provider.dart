import 'dart:io';

import 'package:alquilafacil/spaces/data/remote/helpers/space_service_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../../domain/model/space.dart';

class SpaceProvider extends ChangeNotifier {
  final SpaceServiceHelper spaceService;
  List<Space> spaces = [];
  List<Space> currentSpaces = [];
  List<String> districts = [];
  List<String> expectDistricts = [];
  List<String> ranges = [];
  int maxRange = 0;
  int minRange = 0;
  int categorySelected = 0;
  String cityPlace = "";
  Space? spaceSelected;
  String spacePhotoUrl = "";
  bool isEditMode = false;
  int currentPrice = 0;
  String currentFeatures = "";
  var logger = Logger();

  String currentLocalName = "";
  String currentStreetAddress = "";
  int currentCapacity = 0;
  String currentDescription = "";
  String currentCityPlace = "";

  SpaceProvider(this.spaceService);

  Future<void> getAllSpaces() async {
    try {
      spaces = await spaceService.getAllSpaces();
    } catch (e) {
      spaces = [];
    }
    notifyListeners();
  }

  void setCityPlace(String newCityPlace) {
    cityPlace = newCityPlace;
    notifyListeners();
  }

  void searchSpaceByName(String district) {
    currentSpaces = spaces
        .where((space) => space.streetAddress.toLowerCase().contains(district.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void searchDistrict() {
    expectDistricts = districts
        .where((district) => district.toLowerCase().contains(cityPlace.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> getAllDistricts() async {
    try {
      var districtsResponse = await spaceService.getAllDistricts();
      districts = districtsResponse.toList();
    } catch (e) {
      logger.e("Error while trying to fetch spaces districts, please check the service request");
    }
    notifyListeners();
  }

  void getFilterRanges() {
    var rangesCaught = spaceService.getFilterRanges(ranges);
    minRange = rangesCaught[0];
    maxRange = rangesCaught[1];
    notifyListeners();
  }

  Future<void> searchDistrictsByCategoryIdAndRange() async {
    try {
      var districtsResponse = await spaceService
          .getAllSpacesByCategoryIdAndCapacityRange(categorySelected, minRange, maxRange);
      currentSpaces = districtsResponse.toList();
    } catch (e) {
      logger.e("Error while trying to fetch spaces districts, please check the service request");
    }
    notifyListeners();
  }

  Future<void> fetchMySpaces(int userId) async {
    try {
      currentSpaces = await spaceService.getSpacesByUserId(userId);
    } catch (e) {
      logger.e("Error while trying to fetch my spaces, please check the params");
    }
    notifyListeners();
  }

  void setSelectedSpace(Space currentSpaceSelected) {
    spaceSelected = currentSpaceSelected;
    notifyListeners();
  }

  void selectSpace(Space currentSpaceSelected) {
    spaceSelected = currentSpaceSelected;
    notifyListeners();
  }

  Future<void> fetchSpaceById(int id) async {
    spaceSelected = await spaceService.getSpaceById(id);
    notifyListeners();
  }

  Future<void> uploadImage(File image) async {
    try {
      spacePhotoUrl = await spaceService.uploadImage(image);
    } catch (e) {
      logger.e("Error while trying to upload image, please check the service request", e);
    }
    notifyListeners();
  }

  Future<void> createSpace(Space space) async {
    try {
      await spaceService.createSpace(space);
    } catch (e) {
      logger.e("Error while trying to create space, please check the service request", e);
    }
    notifyListeners();
  }

  Future<void> updateSpace() async {
    final spaceId = spaceSelected!.id;

    List<String> completeCityPlace;
    if (currentCityPlace != null && currentCityPlace.isNotEmpty) {
      completeCityPlace = currentCityPlace.split(",").map((part) => part.trim()).toList();
    } else {
      completeCityPlace = spaceSelected!.cityPlace.split(",").map((part) => part.trim()).toList();
    }

    List<String> addressParts;
    if (currentStreetAddress != null && currentStreetAddress.isNotEmpty) {
      addressParts = currentStreetAddress.split(",").map((part) => part.trim()).toList();
    } else {
      addressParts = spaceSelected!.streetAddress.split(",").map((part) => part.trim()).toList();
    }
    String localName = spaceSelected!.localName;
    int nightPrice = (spaceSelected!.nightPrice).toInt();
    String descriptionMessage = spaceSelected!.descriptionMessage;
    String features  = spaceSelected!.features;
    int capacity = spaceSelected!.capacity;
    Map<String, dynamic> space = {
      'district': addressParts.isNotEmpty ? addressParts[0] : spaceSelected!.streetAddress.split(",")[0],
      'street': addressParts.length > 1 ? addressParts[1] : spaceSelected!.streetAddress.split(",")[1],
      'localName': currentLocalName.isNotEmpty ? currentLocalName : localName,
      'country': completeCityPlace.isNotEmpty ? completeCityPlace[0] : spaceSelected!.cityPlace.split(",")[0],
      'city': completeCityPlace.length > 1 ? completeCityPlace[1] : spaceSelected!.cityPlace.split(",")[1],
      'price': (currentPrice > 0 ? currentPrice : nightPrice).toInt(),
      'photoUrl': spaceSelected!.photoUrl,
      'descriptionMessage': currentDescription.isNotEmpty ? currentDescription : descriptionMessage,
      'localCategoryId': spaceSelected!.localCategoryId,
      'userId': spaceSelected!.userId,
      'features': currentFeatures.isNotEmpty ? currentFeatures : features,
      'capacity': currentCapacity > 0 ? currentCapacity : capacity,
    };

    logger.d(space);

    try {
      await spaceService.updateSpace(spaceId, space);
      notifyListeners();
    } catch (e) {
      logger.e("Error while trying to update space, please check the service request", e);
    }
  }

  void setCurrentCityPlace(String newCityPlace) {
    currentCityPlace = newCityPlace;
    notifyListeners();
  }
  void setIsEditMode() {
    isEditMode = !isEditMode;
    notifyListeners();
  }

  void setCurrentPrice(int newPrice) {
    currentPrice = newPrice;
    notifyListeners();
  }

  void setFeatures(String newFeatures) {
    currentFeatures = newFeatures;
    notifyListeners();
  }

  void setLocalName(String value) {
    currentLocalName = value;
    notifyListeners();
  }

  void setStreetAddress(String value) {
    currentStreetAddress = value;
    notifyListeners();
  }

  void setCapacity(int value) {
    currentCapacity = value;
    notifyListeners();
  }

  void setDescription(String value) {
    currentDescription = value;
    notifyListeners();
  }
}
