import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/core/customers/customer_datails.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getCustomers(String? query);
  Future<CustomerDetail> getCustomerDetail(String id);
}
