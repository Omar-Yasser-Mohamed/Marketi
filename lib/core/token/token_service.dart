abstract class TokenService {
  Future<void> setToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
}
