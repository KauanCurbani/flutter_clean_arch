import 'package:delivery_flutter/core/customers/customer_use_case.dart';
import 'package:delivery_flutter/presentation/pages/presenters/getx_homepage_presenter.dart';
import 'package:delivery_flutter/ui/pages/homepage/homepage_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
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

    expect(sut.loading, false);

    sut.loadData();

    expect(sut.loading, true);
    await Future.delayed(const Duration(milliseconds: 500));
    expect(sut.loading, false);
  });
}
