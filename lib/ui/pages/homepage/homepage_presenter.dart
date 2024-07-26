import 'package:delivery_flutter/core/customers/customer.dart';

abstract class HomepagePresenter {
  Future<void> loadData();
  Future<void> search(String query);

  bool get loading;
  List<Customer> get customers;
}
