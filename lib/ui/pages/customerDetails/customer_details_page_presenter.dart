import 'package:delivery_flutter/core/customers/customer_details.dart';

abstract class CustomerDetailsPagePresenter {
  Future<void> getCustomerDetail(String id);
  CustomerDetail? get customerDetail;
  bool get isLoading;
}
