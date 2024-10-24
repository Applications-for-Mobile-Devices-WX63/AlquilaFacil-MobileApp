import 'package:alquilafacil/profile/data/remote/helpers/user_service_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class ProfileProvider extends ChangeNotifier{
  String usernameExpect = "";
  List<dynamic> usernamesExpect = [];
  final UserServiceHelper userServiceHelper;
  ProfileProvider(this.userServiceHelper);
  Future<void> fetchUsernameExpect(int userId) async{
    try{
      usernameExpect = await userServiceHelper.getUsernameByUserId(userId);
    } catch(_){
      Logger().e("Error while trying to fetch username");
    }
    notifyListeners();
  }

  Future<void> fetchUsernamesExpect(List<dynamic> userIds) async{
    try{
      for (int i = 0; i < userIds.length; i++){
        usernameExpect = await userServiceHelper.getUsernameByUserId(userIds[i]);
        usernamesExpect.add(usernameExpect);
      }
    } catch(_){
      Logger().e("Error while trying to fetch username");
    }
    notifyListeners();
  }
}