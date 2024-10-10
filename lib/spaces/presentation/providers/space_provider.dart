import 'package:alquilafacil/spaces/data/remote/helpers/space_service_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../domain/model/space.dart';

class SpaceProvider extends ChangeNotifier{

  List<Space> spaces = [];
  List<Space> currentSpaces = [];
  String cityPlace= "";

  Future<void> getAllSpaces() async{
    var spaceService = SpaceServiceHelper();
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
}