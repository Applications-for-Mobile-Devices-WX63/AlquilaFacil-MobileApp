

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
  List<String> expectDistricts = [];
  List<String> capacitiesSelected = [];
  String categorySelected = "";
  String cityPlace= "";
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


    void searchSpaceByName(String district)  {
     currentSpaces= spaces.where((space) => space.streetAddress.toLowerCase().contains(district.toLowerCase())).toList();
     notifyListeners();
  }

  void searchDistrict(){
    expectDistricts= districts.where((district) => district.toLowerCase().contains(cityPlace.toLowerCase())).toList();
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
}