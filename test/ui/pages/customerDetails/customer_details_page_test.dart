import 'package:delivery_flutter/core/customers/customer_details.dart';
import 'package:delivery_flutter/ui/pages/customerDetails/customer_details_page_presenter.dart';
import 'package:delivery_flutter/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'customer_details_page_test.mocks.dart';

@GenerateMocks([CustomerDetailsPagePresenter])
void main() {
  CustomerDetailsPagePresenter presenter = MockCustomerDetailsPagePresenter();
  CustomerDetail defaultCustomerDetail = CustomerDetail(
      id: "1", 
      externalCode: "1",
      cnpj: "1",
      ie: "1",
      name: "any_name",
      tradeName: "1",
      street: "any_street",
      district: "any_district",
      city: "any_city",
      state: "any_state",
      zipCode: "any_zipCode",
      phones: [],
      blocked: false,
      simplesNacional: false,
      type: "1",
      appliedSt: false,
      paymentPlans: [],
      partnerId: "1",
      creditLimit: 1);

  Future<void> makeRender(WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(
      initialRoute: "/${defaultCustomerDetail.id}",
      getPages: [
        GetPage(name: '/:id', page: () => const CustomerDetailsPage()),
      ],
    ));
  }

  setUp(() {
    Get.reset();
    presenter = MockCustomerDetailsPagePresenter();

    when(presenter.getCustomerDetail("1")).thenAnswer((_) async {});
    when(presenter.customerDetail).thenReturn(defaultCustomerDetail);
    when(presenter.isLoading).thenReturn(false.obs);
    Get.put<CustomerDetailsPagePresenter>(presenter);
  });

  testWidgets("should render loading text in appBar if isLoading is truthy",
      (WidgetTester tester) async {
    when(presenter.isLoading).thenReturn(true.obs);
    await makeRender(tester);
    expect(find.text("Carregando..."), findsOneWidget);
  });

  testWidgets(
      "should render customer name in appBar title if isLoading is falsy",
      (WidgetTester tester) async {
    when(presenter.isLoading).thenReturn(false.obs);
    await makeRender(tester);

    var appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);

    var title = find.descendant(
        of: appBar, matching: find.text(defaultCustomerDetail.name));
    expect(title, findsOneWidget);
  });

  testWidgets("should call getCustomerDetail on page load",
      (WidgetTester tester) async {
    await makeRender(tester);
    await tester.pumpAndSettle();
    verify(presenter.getCustomerDetail("1")).called(1);
  });

  testWidgets("should render CircularProgressIndicator if isLoading is truthy",
      (WidgetTester tester) async {
    when(presenter.isLoading).thenReturn(true.obs);
    await makeRender(tester);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets("should render customer detail if isLoading is falsy",
      (WidgetTester tester) async {
    when(presenter.isLoading).thenReturn(false.obs);
    await makeRender(tester);

    expect(find.text(defaultCustomerDetail.name), findsWidgets);
    expect(find.text(defaultCustomerDetail.cnpj), findsOneWidget);
    expect(find.text(defaultCustomerDetail.blocked ? 'Bloqueado' : ''),
        findsOneWidget);
    expect(find.text(defaultCustomerDetail.street), findsOneWidget);
    expect(find.text(defaultCustomerDetail.district), findsOneWidget);
    expect(
        find.text(
            "${defaultCustomerDetail.city} • ${defaultCustomerDetail.state}"),
        findsOneWidget);
    expect(find.text(defaultCustomerDetail.zipCode), findsOneWidget);
  });
}
