import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/ui/pages/homepage/homepage_presenter.dart';
import 'package:delivery_flutter/ui/pages/pages.dart';
import 'package:delivery_flutter/ui/widgets/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'homepage_test.mocks.dart';

@GenerateMocks([HomepagePresenter])
void main() {
  HomepagePresenter presenter = MockHomepagePresenter();
  Customer customer = Customer(
      id: "id",
      name: "name",
      status: "status",
      purchaseStatus: "purchaseStatus",
      cnpj: "cnpj",
      externalCode: "externalCode");

  Future<void> makeRender(WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const Homepage()),
        GetPage(name: "/customer/:id", page: () => const Scaffold()),
      ],
    ));
  }

  setUp(() {
    Get.reset();
    presenter = MockHomepagePresenter();
    when(presenter.loadData()).thenAnswer((_) async {});
    when(presenter.customers).thenReturn(<Customer>[customer].obs);
    when(presenter.loading).thenReturn(false.obs);
    Get.put<HomepagePresenter>(presenter);
  });

  testWidgets('should call loadData on page load', (WidgetTester tester) async {
    await makeRender(tester);
    verify(presenter.loadData()).called(1);
  });

  testWidgets("should render list of customer", (WidgetTester tester) async {
    when(presenter.loading).thenReturn(false.obs);

    await makeRender(tester);
    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(CustomerCard), findsOneWidget);
  });

  testWidgets("should render loading indicator", (WidgetTester tester) async {
    when(presenter.loading).thenReturn(true.obs);
    await makeRender(tester);

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets("should call search on text change", (WidgetTester tester) async {
    await makeRender(tester);

    await tester.enterText(find.byType(TextField), "search");
    // 1 second to debounce
    await tester.pumpAndSettle(const Duration(seconds: 1));

    verify(presenter.search("search")).called(1);
  });

  testWidgets("should call presenter.loadData() onRefresh in RefreshIndicator",
      (tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await makeRender(tester);
    await tester.pumpAndSettle();

    await tester.fling(
        find.byType(CustomerCard), const Offset(0.0, 300.0), 1000.0);
    await tester.pump();

    expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ));

    await tester
        .pump(const Duration(seconds: 1)); // finish the scroll animation
    await tester.pump(
        const Duration(seconds: 1)); // finish the indicator settle animation
    await tester.pump(
        const Duration(seconds: 1)); // finish the indicator hide animation

    // 2 times because the first one is on page load
    verify(presenter.loadData()).called(2);
    handle.dispose();
  });

  testWidgets(
      "should call onTapCustomer method to redirect when click in customer",
      (tester) async {
    when(presenter.onTapCustomer(customer)).thenAnswer((_) async {});
    await makeRender(tester);

    await tester.tap(find.byType(CustomerCard));

    verify(presenter.onTapCustomer(customer)).called(1);
  });
}
