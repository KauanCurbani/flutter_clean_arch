import 'package:delivery_flutter/core/auth/auth_use_case.dart';
import 'package:delivery_flutter/ui/pages/splash/splash_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxSplashPresenter extends GetxController implements SplashPresenter {
  final AuthUseCase authUseCase;

  GetxSplashPresenter(this.authUseCase);

  @override
  Future<void> goTo(String route) async {
    Get.offAllNamed(route);
  }

  @override
  Future<void> checkAccount() async {
    //TODO: implement checkAccount
    // verify if the user is logged in
    return;
  }

  @override
  Future<void> loadData() async {
    try {
      await checkAccount();
      // temporary login
      // await authUseCase.authenticate("curbanii", "admin");

      goTo("/login");
    } catch (e) {
      Get.snackbar("Falha ao tentar entrar!", e.toString(),
          snackPosition: SnackPosition.TOP, icon: const Icon(Icons.error));
    }
  }
}
