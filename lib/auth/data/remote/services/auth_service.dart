abstract class AuthService {
   Future<String> signIn(String email, String password);
   Future<String> signUp(String username, String password, String email);
}