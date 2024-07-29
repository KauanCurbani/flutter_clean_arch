import 'package:get/get.dart';

abstract class LoginPagePresenter {
  Future<void> login(String email, String password);

  RxBool get loading;
}
