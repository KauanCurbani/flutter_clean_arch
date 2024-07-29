import 'package:delivery_flutter/core/customers/customer_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("CustomerDetail factory method should return class with Map", () {
    // Arrange
    final json = {
      "id": "1",
      "externalCode": "1",
      "cnpj": "1",
      "ie": "1",
      "name": "1",
      "tradeName": "1",
      "street": "1",
      "district": "1",
      "city": "1",
      "state": "1",
      "zipCode": "1",
      "phones": [],
      "blocked": false,
      "simplesNacional": false,
      "type": "1",
      "appliedSt": false,
      "paymentPlans": [],
      "partnerId": "1",
      "creditLimit": 1
    };

    // Act
    final customerDetail = CustomerDetail.fromJson(json);

    // Assert
    expect(customerDetail.id, "1");
    expect(customerDetail.externalCode, "1");
    expect(customerDetail.cnpj, "1");
    expect(customerDetail.ie, "1");
    expect(customerDetail.name, "1");
    expect(customerDetail.tradeName, "1");
    expect(customerDetail.street, "1");
    expect(customerDetail.district, "1");
    expect(customerDetail.city, "1");
    expect(customerDetail.state, "1");
    expect(customerDetail.zipCode, "1");
    expect(customerDetail.phones, []);
    expect(customerDetail.blocked, false);
    expect(customerDetail.simplesNacional, false);
    expect(customerDetail.type, "1");
    expect(customerDetail.appliedSt, false);
    expect(customerDetail.paymentPlans, []);
    expect(customerDetail.partnerId, "1");
    expect(customerDetail.creditLimit, 1);
  });

  test("PhoneNumber factory method should return class with Map", () {
    // Arrange
    final json = {
      "phoneNumberId": "1",
      "phoneNumber": "1",
      "verified": false,
      "type": "1"
    };

    // Act
    final phoneNumber = PhoneNumber.fromJson(json);

    // Assert
    expect(phoneNumber.phoneNumberId, "1");
    expect(phoneNumber.phoneNumber, "1");
    expect(phoneNumber.verified, false);
    expect(phoneNumber.type, "1");
  });

  test("PhoneNumber factory method should return class with Map", () {
    // Arrange
    final json = {
      "id": "1",
      "description": "1",
    };

    // Act
    final payment = PaymentPlan.fromJson(json);

    // Assert
    expect(payment.id, "1");
    expect(payment.description, "1");
  });
}
