import 'dart:ffi';
import 'dart:io';

import 'package:alquilafacil/auth/data/remote/helpers/auth_service_helper.dart';
import 'package:alquilafacil/auth/shared/AuthFilter.dart';
import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier with AuthFilter {
  String _email = "";
  String _password = "";
  String _token = " ";
  final AuthServiceHelper _serviceHelper =  AuthServiceHelper();

  String get email => _email;
  String get password => _password;
  String get token => _token;
  AuthServiceHelper get serviceHelper => _serviceHelper;

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

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setToken(String token){
    _token = token;
    notifyListeners();
  }
  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future signIn() async {
    var tokenResponse = await serviceHelper.signIn(email, password);
    setToken(tokenResponse);
    notifyListeners();
  }
}
