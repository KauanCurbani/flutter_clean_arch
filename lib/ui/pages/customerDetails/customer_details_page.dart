import 'package:delivery_flutter/ui/pages/customerDetails/customer_details_page_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CustomerDetailsPage extends StatelessWidget {
  const CustomerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomerDetailsPagePresenter presenter =
        Get.find<CustomerDetailsPagePresenter>();
    String id = Get.parameters['id'] ?? '';
    presenter.getCustomerDetail(id);

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(presenter.isLoading.value
            ? 'Carregando...'
            : presenter.customerDetail!.name)),
        elevation: 1,
      ),
      body: Column(
        children: [
          Obx(() => presenter.isLoading.value
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Center(child: CircularProgressIndicator()))
              : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        presenter.customerDetail!.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        presenter.customerDetail!.cnpj,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        presenter.customerDetail!.blocked ? 'Bloqueado' : '',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        presenter.customerDetail!.street,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        presenter.customerDetail!.district,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "${presenter.customerDetail!.city} • ${presenter.customerDetail!.state}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        presenter.customerDetail!.zipCode,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )),
        ],
      ),
    );
  }
}
