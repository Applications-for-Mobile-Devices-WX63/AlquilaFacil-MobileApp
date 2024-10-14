import 'package:alquilafacil/auth/shared/AuthFilter.dart';
import 'package:flutter/material.dart';

import '../../data/remote/helpers/auth_service_helper.dart';

class SignUpProvider extends ChangeNotifier with AuthFilter {
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String successFulMessage = "";
  final AuthServiceHelper serviceHelper;
  SignUpProvider(this.serviceHelper);


  @override
  String? validateEmail() {
    if (email.isEmpty) {
      return "El email es requerido";
    }
    if (!email.contains('@')) {
      return "Por favor, ingrese un email valido";
    }
    return null;
  }

  @override
  String? validatePassword() {
    if (password.isEmpty) {
      return "Por favor ingrese una contraseña valida";
    }
    if (password.length < 8) {
      return "La contraseña debe tener como minimo 8 caracteres";
    }
    if(password == "12345678"){
      return "La contraseña no puede ser 12345678";
    }
    return null;
  }


  String? validateConfirmPassword() {
    if (confirmPassword != password) {
      return 'Las contraseñas no coinciden';
    }
    if (confirmPassword.isEmpty) {
      return "Por favor ingrese una contraseña valida";
    }
    if (confirmPassword.length < 8) {
      return "La contraseña debe tener como minimo 8 caracteres";
    }
    if(confirmPassword == "12345678"){
      return "La contraseña no puede ser 12345678";
    }
    return null;
  }

  String? validateUsername(){
    if(username.isEmpty){
      return "Por favor ingrese un nombre de usuario";
    }
    return null;
  }

  void setEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void setPassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  void setUsername(String newUsername){
    username = newUsername;
    notifyListeners();
  }

  void setSuccessfulMessage(String messageResponse){
    successFulMessage = messageResponse;
    notifyListeners();
  }

  void setConfirmPassword(String newConfirmPassword) {
    confirmPassword = newConfirmPassword;
    notifyListeners();
  }

  Future signUp() async {
    var message = await serviceHelper.signUp(username, password, email);
    setSuccessfulMessage(message);
    notifyListeners();
  }
}
