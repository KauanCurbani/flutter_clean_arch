import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/core/customers/customer_use_case.dart';
import 'package:delivery_flutter/ui/pages/homepage/homepage_presenter.dart';
import 'package:get/get.dart';

class GetxHomepagePresenter extends GetxController
    implements HomepagePresenter {
  CustomerUseCase customerUseCase;

  GetxHomepagePresenter(this.customerUseCase);

  final RxList<Customer> _customers = <Customer>[].obs;
  final Rx<bool> _loading = false.obs;
  String? _searchQuery;

  @override
  List<Customer> get customers => _customers;

  @override
  bool get loading => _loading.value;

  @override
  Future<void> loadData() async {
    _loading.value = true;
    var response = await customerUseCase.getCustomers(_searchQuery);
    _customers.value = response;
    _loading.value = false;
  }

  @override
  Future<void> search(String query) async {
    if (query.isEmpty) {
      _searchQuery = null;
    } else {
      _searchQuery = query;
    }
    return loadData();
  }
}
