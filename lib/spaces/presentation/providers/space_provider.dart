

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
  List<String> ranges = [];
  int maxRange = 0;
  int minRange = 0;
  int categorySelected = 0;
  String cityPlace= "";
  Space? spaceSelected;
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

  void getFilterRanges(){
    var rangesCaught = spaceService.getFilterRanges(ranges);
    minRange = rangesCaught[0];
    maxRange = rangesCaught[1];
    notifyListeners();
  }

  Future<void> searchDistrictsByCategoryIdAndRange() async {
    try{
      var districtsResponse = await spaceService.getAllSpacesByCategoryIdAndCapacityRange(categorySelected, minRange, maxRange);
      currentSpaces = districtsResponse.toList();
    }catch (e){
      logger.e("Error while trying to fetch spaces districts, please check the service request");
    }
    notifyListeners();
  }

  void setSelectedSpace(Space currentSpaceSelected){
    spaceSelected = currentSpaceSelected;
    notifyListeners();
  }

  void selectSpace(Space currentSpaceSelected){
    spaceSelected = currentSpaceSelected;
    notifyListeners();
  }
}