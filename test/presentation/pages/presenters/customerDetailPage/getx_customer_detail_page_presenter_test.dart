import 'package:delivery_flutter/core/customers/customer_details.dart';
import 'package:delivery_flutter/core/customers/customer_use_case.dart';
import 'package:delivery_flutter/presentation/pages/presenters/getx_customer_detail_page_presenter.dart';
import 'package:delivery_flutter/ui/pages/customerDetails/customer_details_page_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../homepage/getx_homepage_presenter_test.mocks.dart';

@GenerateMocks([CustomerUseCase])
void main() {
  CustomerDetailsPagePresenter sut =
      GetxCustomerDetailPagePresenter(MockCustomerUseCase());
  CustomerUseCase customerUseCaseMock = MockCustomerUseCase();

  CustomerDetail _defaultCustomerDetail = CustomerDetail(
      id: "1",
      externalCode: "1",
      cnpj: "1",
      ie: "1",
      name: "1",
      tradeName: "1",
      street: "1",
      district: "1",
      city: "1",
      state: "1",
      zipCode: "1",
      phones: [],
      blocked: false,
      simplesNacional: false,
      type: "1",
      appliedSt: false,
      paymentPlans: [],
      partnerId: "1",
      creditLimit: 1);

  setUp(() {
    customerUseCaseMock = MockCustomerUseCase();
    sut = GetxCustomerDetailPagePresenter(customerUseCaseMock);
    when(customerUseCaseMock.getCustomerDetail("1"))
        .thenAnswer((_) async => _defaultCustomerDetail);
  });

  test("should call use case to get customer detail", () async {
    await sut.getCustomerDetail("1");
    verify(customerUseCaseMock.getCustomerDetail("1")).called(1);
  });

  test("should update loading to true when getCustomerDetail is called", () async {
    when(customerUseCaseMock.getCustomerDetail("1")).thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      return _defaultCustomerDetail;
    });

    expect(sut.isLoading, false);

    sut.getCustomerDetail("1");

    expect(sut.isLoading, true);
    await Future.delayed(const Duration(milliseconds: 500));
    expect(sut.isLoading, false);
  });
}
