abstract mixin class AuthFilter{
  String? validateEmail(String email);
  String? validatePassword(String password);
}