import 'package:delivery_flutter/application/auth/auth_repository_impl.dart';
import 'package:delivery_flutter/application/customers/customer_repository_impl.dart';
import 'package:delivery_flutter/application/http/dio_http_client.dart';
import 'package:delivery_flutter/core/auth/auth_use_case.dart';
import 'package:delivery_flutter/core/customers/customer_use_case.dart';
import 'package:delivery_flutter/core/http/http_client.dart';
import 'package:delivery_flutter/presentation/pages/presenters.dart';
import 'package:delivery_flutter/ui/pages/presenters.dart';
import 'package:get/get.dart';

void getxInjection() {
  Get.put<HttpClient>(DioHttpClient());

  Get.put<SplashPresenter>(
      GetxSplashPresenter(AuthUseCase(AuthRepositoryImpl())));
  Get.put<HomepagePresenter>(
      GetxHomepagePresenter(CustomerUseCase(CustomerRepositoryImpl())));
  Get.put<CustomerDetailsPagePresenter>(GetxCustomerDetailPagePresenter(
      CustomerUseCase(CustomerRepositoryImpl())));
  Get.put<LoginPagePresenter>(
      GetxLoginPagePresenter(AuthUseCase(AuthRepositoryImpl())));
}
