import 'package:delivery_flutter/ui/pages/pages.dart';
import 'package:delivery_flutter/ui/pages/splash/splash_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'splash_test.mocks.dart';

@GenerateMocks([SplashPresenter])
void main() {
  SplashPresenter presenter = MockSplashPresenter();

  Future<void> makeRender(WidgetTester tester) async {
    Get.put<SplashPresenter>(presenter);

    await tester.pumpWidget(const GetMaterialApp(
      home: Splash(),
    ));
  }

  setUp(() {
    Get.reset();
    presenter = MockSplashPresenter();
    Get.put<SplashPresenter>(presenter);
  });

  testWidgets('should call loadData on page load', (WidgetTester tester) async {
    await makeRender(tester);
    verify(presenter.loadData()).called(1);
  });

  testWidgets("should render splash text", (WidgetTester tester) async {
    await makeRender(tester);
    expect(find.text("Splash"), findsOneWidget);
  });
}
