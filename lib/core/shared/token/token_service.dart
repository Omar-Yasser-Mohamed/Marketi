abstract class TokenService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();

  Future<void> saveUserId(String userId);
  Future<String?> getUserId();
  Future<void> deleteUserId();
}
