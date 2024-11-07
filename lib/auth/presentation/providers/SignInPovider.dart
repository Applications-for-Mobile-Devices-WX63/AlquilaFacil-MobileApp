

import 'package:alquilafacil/auth/data/remote/helpers/auth_service_helper.dart';
import 'package:alquilafacil/auth/shared/AuthFilter.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier with AuthFilter {
  String email = "";
  String password = "";
  String token = "";
  int userId = 0;
  final AuthServiceHelper authServiceHelper;
  SignInProvider(this.authServiceHelper);
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

  void setUserId(int id){
    userId = id;
    notifyListeners();
  }

  void setToken(String newToken) {
    token = newToken;
    notifyListeners();
  }

  void setPassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }

  Future<void> onSignInSuccessful() async {
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setString("token", token);
   notifyListeners();
  }

  Future<void> onLogOutRequest() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove("token");
    token = "";
    email = "";
    password = "";
    userId = 0;
    notifyListeners();
  }

  Future<bool> onSessionActive() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isSessionActive = sharedPreferences.get("token") != null;
    return isSessionActive;
  }


  Future<void> signIn() async {
    var json = await authServiceHelper.signIn(email, password);
    setToken(json["token"]);
    setUserId(json["id"]);
    notifyListeners();
  }
}
