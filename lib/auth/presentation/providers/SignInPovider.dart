import 'package:alquilafacil/auth/shared/AuthFilter.dart';
import 'package:flutter/cupertino.dart';


class SignInProvider extends ChangeNotifier with AuthFilter  {
  String _email = "";
 String _password = "";

 String get email => _email;
 String get password => _password;

 @override
 String? validateEmail()  {
    if(email.isEmpty ){
      return "El email es requerido";
    }
    if(!email.contains('@')){
      return "Por favor, ingrese un email valido";
   }
    return null;
 }

  @override
  String? validatePassword(){
   if(password.isEmpty ){
    return "Por favor ingrese una contraseña valida";
   }
   if(password.length < 8){
    return "La contraseña debe tener como minimo 8 caracteres";
   }
   return null;

  }


 void setEmail(String email){
  _email  = email;
  notifyListeners();
 }

 void setPassword(String password){
  _password = password;
  notifyListeners();
 }


}
