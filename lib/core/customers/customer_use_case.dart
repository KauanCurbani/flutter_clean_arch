import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/core/customers/customer_details.dart';
import 'package:delivery_flutter/core/customers/customer_repository.dart';
import 'package:delivery_flutter/shared/format_cnpj_or_cpf.dart';

class CustomerUseCase {
  final CustomerRepository _customerRepository;

  CustomerUseCase(this._customerRepository);

  Future<List<Customer>> getCustomers(String? query) async {
    var response = await _customerRepository.getCustomers(query);

    for (var customer in response) {
      customer.cnpj = formatCnpjOrCpf(customer.cnpj);
    }

    return response;
  }

  Future<CustomerDetail> getCustomerDetail(String id) async {
    var response = await _customerRepository.getCustomerDetail(id);
    response.cnpj = formatCnpjOrCpf(response.cnpj);
    return response;
  }
}
