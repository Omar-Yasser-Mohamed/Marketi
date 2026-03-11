import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/shared/token/token_service.dart';

@LazySingleton(as: TokenService)
class TokenServiceImpl implements TokenService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _tokenKey = "auth_token";
  static const String _userIdKey = "user_id";

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<void> saveUserId(String userId) async {
    await _storage.write(key: _userIdKey, value: userId);
  }

  @override
  Future<String?> getUserId() async {
    return await _storage.read(key: _userIdKey);
  }

  @override
  Future<void> deleteUserId() async {
    await _storage.delete(key: _userIdKey);
  }
}
