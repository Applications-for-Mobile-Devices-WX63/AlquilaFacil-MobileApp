import 'package:alquilafacil/auth/shared/AuthFilter.dart';
import 'package:flutter/material.dart';

import '../../data/remote/helpers/auth_service_helper.dart';

class SignUpProvider extends ChangeNotifier with AuthFilter {
  String _username = " ";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _successFulMessage = "";
  final AuthServiceHelper _serviceHelper =  AuthServiceHelper();

  String get email => _email;
  String get password => _password;
  String get username => _username;
  String get confirmPassword => _confirmPassword;
  String get successFullMessage => _successFulMessage;
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
    _email = newEmail;
    notifyListeners();
  }

  void setPassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void setUsername(String newUsername){
    _username = newUsername;
    notifyListeners();
  }

  void setSuccessfulMessage(String messageResponse){
    _successFulMessage = messageResponse;
    notifyListeners();
  }

  void setConfirmPassword(String newConfirmPassword) {
    _confirmPassword = newConfirmPassword;
    notifyListeners();
  }

  Future signUp() async {
    var message = await serviceHelper.signUp(username, password, email);
    setSuccessfulMessage(message);
    notifyListeners();
  }
}
