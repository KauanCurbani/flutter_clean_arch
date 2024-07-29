import 'package:delivery_flutter/core/customers/customer_details.dart';
import 'package:get/get.dart';

abstract class CustomerDetailsPagePresenter {
  Future<void> getCustomerDetail(String id);
  CustomerDetail? get customerDetail;
  RxBool get isLoading;
}
