import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/core/customers/customer_details.dart';
import 'package:delivery_flutter/core/customers/customer_repository.dart';
import 'package:delivery_flutter/core/http/http_client.dart';
import 'package:get/get.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  late HttpClient _httpClient;

  CustomerRepositoryImpl() {
    _httpClient = Get.find<HttpClient>();
  }

  @override
  Future<List<Customer>> getCustomers(String? query) async {
    String url = "/sales-force/customer?page=0&orderBy=TRADENAME_ASC&size=150";
    if (query != null) url += "&filter=$query";
    
    var response = await _httpClient.request(
      url: url,
      method: "GET",
    );

    return response["items"]
        .map<Customer>((x) => Customer.fromJson(x))
        .toList();
  }

  @override
  Future<CustomerDetail> getCustomerDetail(String id) async {
    var response = await _httpClient.request(
      url: "/sales-force/customer/$id",
      method: "GET",
    );

    return CustomerDetail.fromJson(response);
  }
}
