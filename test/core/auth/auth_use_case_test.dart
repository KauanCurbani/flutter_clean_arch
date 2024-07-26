import 'package:delivery_flutter/core/auth/auth_repository.dart';
import 'package:delivery_flutter/core/auth/auth_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository authRepositoryMock;

  setUp(() {
    authRepositoryMock = MockAuthRepository();
    when(authRepositoryMock.login("username", "password"))
        .thenAnswer((_) async => {"token": "any_token"});
  });

  test("should call repo to do authentication", () async {
    AuthUseCase authUseCase = AuthUseCase(authRepositoryMock);
    await authUseCase.authenticate("username", "password");

    verify(authRepositoryMock.login("username", "password")).called(1);
  });

  test("should return an map with token key and your respective value",
      () async {
    AuthUseCase authUseCase = AuthUseCase(authRepositoryMock);
    Map<String, dynamic> response =
        await authUseCase.authenticate("username", "password");

    verify(authRepositoryMock.login("username", "password")).called(1);
    expect(response["token"], "any_token");
  });
}
