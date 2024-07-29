import 'package:delivery_flutter/core/auth/auth_use_case.dart';
import 'package:delivery_flutter/presentation/pages/presenters/getx_login_page_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'getx_login_page_presenter_test.mocks.dart';

@GenerateMocks([AuthUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetxLoginPagePresenter sut;
  AuthUseCase customerUseCase = MockAuthUseCase();

  setUp(() {
    customerUseCase = MockAuthUseCase();
    sut = GetxLoginPagePresenter(customerUseCase);

    Get.testMode = true;
    when(customerUseCase.authenticate("username", "password"))
        .thenAnswer((_) async {
      return {};
    });
  });

  test("should call use case to authenticate", () async {
    await sut.login("username", "password");

    verify(customerUseCase.authenticate("username", "password")).called(1);
  });

  test("should update loading to true when login is called", () async {
    when(customerUseCase.authenticate("username", "password"))
        .thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      return {};
    });

    expect(sut.loading.value, false);

    sut.login("username", "password");

    expect(sut.loading.value, true);
    await Future.delayed(const Duration(milliseconds: 500));
    expect(sut.loading.value, false);
  });

  test("loading getter should return false by default", () {
    expect(sut.loading.value, false);
  });
}
