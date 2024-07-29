import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("factory method from json should return customer class with an json",
      () {
    // Arrange
    final json = {
      "id": "id",
      "name": "name",
      "status": "status",
      "purchaseStatus": "purchaseStatus",
      "cnpj": "cnpj",
      "externalCode": "externalCode"
    };

    // Act
    final customer = Customer.fromJson(json);

    // Assert
    expect(customer.id, "id");
    expect(customer.name, "name");
    expect(customer.status, "status");
    expect(customer.purchaseStatus, "purchaseStatus");
    expect(customer.cnpj, "cnpj");
    expect(customer.externalCode, "externalCode");
  });

  test("should parse lastOrderDate to DateTime if exist", () {
    // Arrange
    final json = {
      "id": "id",
      "name": "name",
      "status": "status",
      "purchaseStatus": "purchaseStatus",
      "cnpj": "cnpj",
      "externalCode": "externalCode",
      "lastOrderDate": "2021-09-01T00:00:00.000Z"
    };

    // Act
    final customer = Customer.fromJson(json);

    // Assert
    expect(customer.lastOrderDate, DateTime.parse("2021-09-01T00:00:00.000Z"));
  });
}
