import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:get/get.dart';

abstract class HomepagePresenter {
  Future<void> loadData();
  Future<void> search(String query);
  Future<void> onTapCustomer(Customer customer);

  RxBool get loading;
  RxList<Customer> get customers;
}
