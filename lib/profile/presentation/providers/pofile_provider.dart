import 'package:alquilafacil/profile/data/remote/helpers/user_service_helper.dart';
import 'package:alquilafacil/profile/domain/model/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class ProfileProvider extends ChangeNotifier {
  String usernameExpect = "";
  String name = "";
  String fatherName = "";
  String motherName = "";
  String documentNumber = "";
  String dateOfBirth = "";
  String phoneNumber = "";
  int userId = 0;

  Profile? currentProfile;
  List<dynamic> usernamesExpect = [];
  final UserServiceHelper userServiceHelper;

  ProfileProvider(this.userServiceHelper);

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setFatherName(String value) {
    fatherName = value;
    notifyListeners();
  }

  void setMotherName(String value) {
    motherName = value;
    notifyListeners();
  }


  void setDocumentNumber(String value) {
    documentNumber = value;
    notifyListeners();
  }

  void setDateOfBirth(String value) {
    dateOfBirth = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  void setUserId(int value) {
    userId = value;
    notifyListeners();
  }

  String? validatePhoneNumber(){
    if (phoneNumber.length != 9){
      return "El número de contacto debe ser de 9 digitos";
    }
    else{
      return null;
    }
  }

  String? validateName(){
    if (name.isEmpty || motherName.isEmpty || fatherName.isEmpty ){
      return "${name.isEmpty ? "Nombre": "Appellido paterno y materno"}  es un campo requerido";
    }
    else{
      return null;
    }
  }

  String? validateDateOfBirth() {
    final regex = RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{2}$');

    if (!regex.hasMatch(dateOfBirth)) {
      return "La fecha debe estar en el formato DD/MM/YY";
    }

    final parts = dateOfBirth.split('/');
    final day = int.parse(parts[0]);
    final month = int.parse(parts[1]);
    final year = int.parse(parts[2]);


    try {
      final validDate = DateTime(2000 + year, month, day);
      if (validDate.day != day || validDate.month != month) {
        return "La fecha no es válida.";
      }
    } catch (e) {
      return "La fecha no es válida.";
    }
    final currentDate = DateTime.now();
    if (DateTime(2000 + year, month, day).isAfter(currentDate)) {
      return "La fecha de nacimiento no puede ser en el futuro.";
    }

    return null;
  }


  Future<void> createProfile(String email, String password) async {
    currentProfile = await userServiceHelper.createProfile(
      email,
      password,
      name,
      fatherName,
      motherName,
      documentNumber,
      dateOfBirth,
      phoneNumber
    );
    notifyListeners();
  }

  Future<void> fetchUsernameExpect(int userId) async {
    try {
      usernameExpect = await userServiceHelper.getUsernameByUserId(userId);
    } catch (_) {
      Logger().e("Error while trying to fetch username");
    }
    notifyListeners();
  }

  Future<void> fetchUsernamesExpect(List<dynamic> userIds) async {
    try {
      usernamesExpect = [];
      for (int i = 0; i < userIds.length; i++) {
        usernameExpect = await userServiceHelper.getUsernameByUserId(userIds[i]);
        usernamesExpect.add(usernameExpect);
      }
    } catch (_) {
      Logger().e("Error while trying to fetch username");
    }
    notifyListeners();
  }
}
