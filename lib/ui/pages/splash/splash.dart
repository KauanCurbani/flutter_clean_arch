import 'package:delivery_flutter/ui/pages/splash/splash_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    SplashPresenter splashPresenter = Get.find<SplashPresenter>();

    splashPresenter.loadData();

    return const Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
