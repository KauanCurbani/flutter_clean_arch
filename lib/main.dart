import 'package:delivery_flutter/application/auth/auth_repository_impl.dart';
import 'package:delivery_flutter/application/customers/customer_repository_impl.dart';
import 'package:delivery_flutter/application/http/dio_http_client.dart';
import 'package:delivery_flutter/core/auth/auth_use_case.dart';
import 'package:delivery_flutter/core/customers/customer_use_case.dart';
import 'package:delivery_flutter/core/http/http_client.dart';
import 'package:delivery_flutter/presentation/pages/factories.dart';
import 'package:delivery_flutter/presentation/pages/presenters/getx_homepage_presenter.dart';
import 'package:delivery_flutter/presentation/pages/presenters/getx_splash_presenter.dart';
import 'package:delivery_flutter/ui/pages/homepage/homepage_presenter.dart';
import 'package:delivery_flutter/ui/pages/splash/splash_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    RouteObserver observer = Get.put<RouteObserver>(RouteObserver());
    Get.put<HttpClient>(DioHttpClient());

    Get.put<SplashPresenter>(
        GetxSplashPresenter(AuthUseCase(AuthRepositoryImpl())));
    Get.put<HomepagePresenter>(
        GetxHomepagePresenter(CustomerUseCase(CustomerRepositoryImpl())));

    return GetMaterialApp(
      title: 'Delivery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: "/splash",
      navigatorObservers: [observer],
      getPages: [
        GetPage(
          name: '/',
          page: makeHomepage,
        ),
        GetPage(
          name: '/splash',
          page: makeSplash,
        ),
        GetPage(name: "/customer/:id", page: makeCustomerDetails)
      ],
    );
  }
}
