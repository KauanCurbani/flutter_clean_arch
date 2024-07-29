import 'package:delivery_flutter/core/auth/auth_use_case.dart';
import 'package:delivery_flutter/ui/pages/login/login_page_presenter.dart';
import 'package:get/get.dart';

class GetxLoginPagePresenter extends GetxController
    implements LoginPagePresenter {
  final _loading = false.obs;

  final AuthUseCase _authUseCase;

  GetxLoginPagePresenter(this._authUseCase);

  @override
  Future<void> login(String email, String password) async {
    _loading.value = true;
    await _authUseCase.authenticate(email, password);
    _loading.value = false;
    await Get.offAndToNamed("/");
  }

  @override
  RxBool get loading => _loading;
}
