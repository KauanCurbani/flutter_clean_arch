import 'package:delivery_flutter/ui/pages/login/login_page_presenter.dart';
import 'package:delivery_flutter/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_page_test.mocks.dart';

@GenerateMocks([LoginPagePresenter])
void main() {
  LoginPagePresenter presenter = MockLoginPagePresenter();

  Future<void> makeRender(WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      initialRoute: "/login",
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: "/", page: () => const Scaffold()),
      ],
    ));
  }

  setUp(() {
    Get.reset();
    presenter = MockLoginPagePresenter();
    when(presenter.loading).thenReturn(false.obs);
    Get.put<LoginPagePresenter>(presenter);
  });

  testWidgets("should render username input", (WidgetTester tester) async {
    await makeRender(tester);
    expect(find.byKey(const Key("username")), findsOneWidget);
  });

  testWidgets("should render password input", (WidgetTester tester) async {
    await makeRender(tester);
    expect(find.byKey(const Key("password")), findsOneWidget);
  });

  testWidgets("should call login on button click", (WidgetTester tester) async {
    await makeRender(tester);
    await tester.enterText(find.byKey(const Key("username")), "username");
    await tester.enterText(find.byKey(const Key("password")), "password");
    await tester.tap(find.byKey(const Key("login_button")));

    verify(presenter.login("username", "password")).called(1);
  });

  testWidgets("should render loading indicator", (WidgetTester tester) async {
    when(presenter.loading).thenReturn(true.obs);
    await makeRender(tester);
    expect(find.text("Entrando..."), findsOneWidget);
  });
}
