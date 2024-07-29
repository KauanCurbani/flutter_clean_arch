import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/ui/widgets/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  Future<void> makeRender(WidgetTester tester, Function()? onTap) async {
    await tester.pumpWidget(GetMaterialApp(
      home: Scaffold(
        body: CustomerCard(
          customer: Customer(
              id: "1",
              externalCode: "123",
              name: "John Doe",
              cnpj: "12345678901",
              activityBranchName: "Branch",
              purchaseStatus: "Active",
              status: "Active",
              lastOrderDate: DateTime.now(),
              tradeName: ""),
          onTapCustomer: (customer) {
            onTap?.call();
          },
        ),
      ),
    ));
  }

  testWidgets("should call onTapCustomer on onTap",
      (WidgetTester tester) async {
    var tapped = false;
    await makeRender(tester, () {
      tapped = true;
    });

    await tester.tap(find.byType(InkWell));
    expect(tapped, true);
  });
}
