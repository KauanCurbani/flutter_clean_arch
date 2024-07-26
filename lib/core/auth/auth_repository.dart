abstract class AuthRepository {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<void> register(String email, String password);
  Future<void> logout();
  Future<bool> isUserLoggedIn();
}
