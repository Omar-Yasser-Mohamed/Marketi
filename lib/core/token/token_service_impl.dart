import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/token/token_service.dart';

@LazySingleton(as: TokenService)
class TokenServiceImpl implements TokenService {
  static const _tokenKey = "auth_token";
  final _storage = const FlutterSecureStorage();

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  @override
  Future<void> setToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }
}
