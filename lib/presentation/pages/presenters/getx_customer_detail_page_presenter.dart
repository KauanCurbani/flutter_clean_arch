import 'package:delivery_flutter/core/customers/customer_details.dart';
import 'package:delivery_flutter/core/customers/customer_use_case.dart';
import 'package:delivery_flutter/ui/pages/customerDetails/customer_details_page_presenter.dart';
import 'package:get/get.dart';

class GetxCustomerDetailPagePresenter extends GetxController
    implements CustomerDetailsPagePresenter {
  CustomerUseCase _customerUseCase;

  GetxCustomerDetailPagePresenter(this._customerUseCase);

  CustomerDetail? _customerDetail;
  final Rx<bool> _loading = false.obs;

  @override
  CustomerDetail? get customerDetail => _customerDetail;
  @override
  bool get isLoading => _loading.value;

  @override
  Future<void> getCustomerDetail(String id) async {
    _loading.value = true;
    _customerDetail = await _customerUseCase.getCustomerDetail(id);
    _loading.value = false;
  }
}
