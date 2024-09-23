import 'package:alquilafacil/auth/shared/AuthFilter.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier with AuthFilter{
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _password = "";
  String _phoneNumber = "";
  String _documentNumber = "";
  String _confirmPassword = "";

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get password => _password;
  String get phoneNumber => _phoneNumber;
  String get documentNumber => _documentNumber;
  String get confirmPassword => _confirmPassword;

  @override
  String? validateEmail() {
    if(email.isEmpty ){
      return "El email es requerido";
    }
    if(!email.contains('@')){
      return "Por favor, ingrese un email valido";
    }
    return null;
  }

  @override
  String? validatePassword() {
    if(password.isEmpty ){
      return "Por favor ingrese una contraseña valida";
    }
    if(password.length < 8){
      return "La contraseña debe tener como minimo 8 caracteres";
    }
    return null;
  }


  String? validateFirstName(){
    if (firstName.isEmpty) {
      return 'Por favor, ingrese su nombre';
    }
    return null;
  }

  String? validateLastName(){
    if(lastName.isEmpty){
      return 'Por favor, ingrese sus apellidos';
    }
    return null;
  }

  String? validatePhoneNumber(){
    if (phoneNumber.isEmpty) {
      return 'Por favor, ingrese su número de teléfono';
    }
    if (phoneNumber.length < 9) {
      return 'El número de teléfono debe tener al menos 9 dígitos';
    }
    return null;
  }

  String? validateDocumentNumber(){
    if (documentNumber.isEmpty) {
       return 'Por favor, ingrese su número de documento';
    }
    return null;
  }

  String? validateConfirmPassword(){
    if(confirmPassword != password){
      return 'Las contraseñas no coinciden';
    }
    if(confirmPassword.isEmpty ){
      return "Por favor ingrese una contraseña valida";
    }
    if(confirmPassword.length < 8){
      return "La contraseña debe tener como minimo 8 caracteres";
    }
    return null;
  }


  void setFirstName(String newFirstName) {
    _firstName = newFirstName;
    notifyListeners();
  }

  void setLastName(String newLastName) {
    _lastName = newLastName;
    notifyListeners();
  }

  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void setPassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void setPhoneNumber(String newPhoneNumber) {
    _phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  void setDocumentNumber(String newDocumentNumber) {
    _documentNumber = newDocumentNumber;
    notifyListeners();
  }

  void setConfirmPassword(String newConfirmPassword) {
    _confirmPassword = newConfirmPassword;
    notifyListeners();
  }




}