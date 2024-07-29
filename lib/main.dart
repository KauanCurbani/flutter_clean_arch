import 'package:delivery_flutter/presentation/pages/factories.dart';
import 'package:delivery_flutter/shared/injection.dart';
import 'package:delivery_flutter/shared/make_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    RouteObserver observer = Get.put<RouteObserver>(RouteObserver());
    getxInjection();
 

    return GetMaterialApp(
      title: 'Delivery',
      theme: makeTheme(),
      initialRoute: "/splash",
      navigatorObservers: [observer],
      getPages: [
        GetPage(name: "/login", page: makeLoginPage),
        GetPage(name: '/', page: makeHomepage),
        GetPage(name: '/splash', page: makeSplash),
        GetPage(name: "/customer/:id", page: makeCustomerDetails),
      ],
    );
  }
}
