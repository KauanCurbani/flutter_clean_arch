import 'package:delivery_flutter/core/auth/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository) ;

  Future<Map<String, dynamic>> authenticate(
      String username, String password) async {
    var response = await _authRepository.login(username, password);
    return response;
  }
}
