import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/core/customers/customer_details.dart';
import 'package:delivery_flutter/core/customers/customer_repository.dart';
import 'package:delivery_flutter/core/customers/customer_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'customer_use_case_test.mocks.dart';

@GenerateMocks([CustomerRepository])
void main() {
  late CustomerRepository customerRepository;

  CustomerDetail _defaultCustomerDetail = CustomerDetail(
      id: "1",
      externalCode: "1",
      cnpj: "20548325000110",
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
  Customer cnpjCustomer = Customer(
    cnpj: "96002319000125",
    name: "any_name",
    id: "any_id",
    externalCode: "any_external_code",
    purchaseStatus: "any_purchase_status",
    status: "any_status",
    tradeName: "any_trade_name",
    activityBranchName: "any_activity_branch_name",
    lastOrderDate: DateTime.now(),
  );
  Customer cpfCustomer = Customer(
    cnpj: "58485359062",
    name: "any_name",
    id: "any_id",
    externalCode: "any_external_code",
    purchaseStatus: "any_purchase_status",
    status: "any_status",
    tradeName: "any_trade_name",
    activityBranchName: "any_activity_branch_name",
    lastOrderDate: DateTime.now(),
  );

  setUp(() {
    customerRepository = MockCustomerRepository();
    when(customerRepository.getCustomers(null))
        .thenAnswer((_) async => [cnpjCustomer]);
  });

  test("should return list of customers", () async {
    // arrange
    var sut = CustomerUseCase(customerRepository);
    // act
    var response = await sut.getCustomers(null);
    // assert
    expect(response, [cnpjCustomer]);
  });

  test("should format cnpj", () async {
    // arrange
    var sut = CustomerUseCase(customerRepository);
    // act
    var response = await sut.getCustomers(null);
    // assert
    expect(response[0].cnpj, "96.002.319/0001-25");
  });

  test("getCustomers should format cpf if is valid", () async {
    // arrange
    when(customerRepository.getCustomers(null))
        .thenAnswer((_) async => [cpfCustomer]);
    var sut = CustomerUseCase(customerRepository);
    // act
    var response = await sut.getCustomers(null);
    // assert
    expect(response[0].cnpj, "584.853.590-62");
  });

  test("should call repository to get customer by id", () async {
    when(customerRepository.getCustomerDetail("any_id"))
        .thenAnswer((_) async => _defaultCustomerDetail);

    var sut = CustomerUseCase(customerRepository);
    await sut.getCustomerDetail("any_id");

    verify(customerRepository.getCustomerDetail("any_id")).called(1);
  });

  test("should format cnpj on getCustomerDetail", () async {
    when(customerRepository.getCustomerDetail("any_id"))
        .thenAnswer((_) async => _defaultCustomerDetail);

    var sut = CustomerUseCase(customerRepository);
    var response = await sut.getCustomerDetail("any_id");

    expect(response.cnpj, "20.548.325/0001-10");
  });
}
