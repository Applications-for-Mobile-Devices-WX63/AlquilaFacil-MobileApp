

import 'package:alquilafacil/auth/data/remote/helpers/auth_service_helper.dart';
import 'package:alquilafacil/auth/shared/AuthFilter.dart';
import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier with AuthFilter {
  String email = "";
  String password = "";
  String token = "";
  final AuthServiceHelper serviceHelper =  AuthServiceHelper();


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
    return null;
  }

  void setEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void setToken(String newToken){
    token = newToken;
    notifyListeners();
  }
  void setPassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  Future signIn() async {
    var tokenResponse = await serviceHelper.signIn(email, password);
    setToken(tokenResponse);
    notifyListeners();
  }
}
