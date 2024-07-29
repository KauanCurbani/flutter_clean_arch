import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/core/customers/customer_use_case.dart';
import 'package:delivery_flutter/presentation/pages/presenters/getx_homepage_presenter.dart';
import 'package:delivery_flutter/ui/pages/homepage/homepage_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'getx_homepage_presenter_test.mocks.dart';

@GenerateMocks([CustomerUseCase])
void main() {
  late HomepagePresenter sut;
  late CustomerUseCase customerUseCase;

  setUp(() {
    customerUseCase = MockCustomerUseCase();
    sut = GetxHomepagePresenter(customerUseCase);

    when(customerUseCase.getCustomers(null)).thenAnswer((_) async => []);
  });

  test("should call use case to get customers", () async {
    await sut.loadData();

    verify(customerUseCase.getCustomers(null)).called(1);
  });

  test("should update loading to true when loadData is called", () async {
    when(customerUseCase.getCustomers(null)).thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      return [];
    });

    expect(sut.loading.value, false);

    sut.loadData();

    expect(sut.loading.value, true);
    await Future.delayed(const Duration(milliseconds: 500));
    expect(sut.loading.value, false);
  });

  test('getter should return list of customers', () async {
    Customer customer = Customer(
        id: "id",
        name: "name",
        status: "status",
        purchaseStatus: "purchaseStatus",
        cnpj: "cnpj",
        externalCode: "externalCode");

    when(customerUseCase.getCustomers(null)).thenAnswer((_) async {
      return [customer];
    });

    await sut.loadData();

    expect(sut.customers, [customer]);
  });

  test("should set _searchQuery when call search method", () async {
    when(customerUseCase.getCustomers("query")).thenAnswer((_) async {
      return [];
    });

    await sut.search("query");
    verify(customerUseCase.getCustomers("query")).called(1);
  });

  test("should set _searchQuery to null if query is empty string", () async {
    when(customerUseCase.getCustomers(null)).thenAnswer((_) async {
      return [];
    });

    await sut.search("");
    verify(customerUseCase.getCustomers(null)).called(1);
  });

  testWidgets("should redirect to /customer/id in onTapCustomer",
      (tester) async {
    Customer customer = Customer(
        id: "id",
        name: "name",
        status: "status",
        purchaseStatus: "purchaseStatus",
        cnpj: "cnpj",
        externalCode: "externalCode");

    await tester.pumpWidget(GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const Scaffold()),
        GetPage(name: "/customer/:id", page: () => const Scaffold()),
      ],
    ));

    await sut.onTapCustomer(customer);

    expect(Get.currentRoute, "/customer/${customer.id}");
  });
}
