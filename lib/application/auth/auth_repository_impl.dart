import 'package:delivery_flutter/core/auth/auth_repository.dart';
import 'package:delivery_flutter/core/http/http_client.dart';
import 'package:get/get.dart';

class AuthRepositoryImpl implements AuthRepository {
  late HttpClient _httpClient;

  AuthRepositoryImpl() {
    _httpClient = Get.find<HttpClient>();
  }

  @override
  Future<bool> isUserLoggedIn() {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    var response = await _httpClient.request(
      url: "/authentication",
      method: "POST",
      body: {"username": username, "password": password},
    );

    _httpClient.addHeader("Authorization", "Bearer ${response["token"]}");

    return {"token": response["token"]};
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> register(String email, String password) {
    throw UnimplementedError();
  }
}
