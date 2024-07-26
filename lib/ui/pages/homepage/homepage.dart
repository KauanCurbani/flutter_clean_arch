import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/ui/pages/homepage/homepage_presenter.dart';
import 'package:delivery_flutter/ui/widgets/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    HomepagePresenter homepagePresenter = Get.find<HomepagePresenter>();
    homepagePresenter.loadData();

    Debouncer debouncer = Debouncer(delay: const Duration(milliseconds: 1000));

    void onChangeText(String value) {
      debouncer(() {
        homepagePresenter.search(value);
      });
    }

    void onTapCustomer(Customer customer) {
      Get.toNamed("/customer/${customer.id}");
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Clientes"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          homepagePresenter.loadData();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => homepagePresenter.loading
                  ? const LinearProgressIndicator()
                  : const SizedBox(height: 4)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => onChangeText(value),
                  decoration: InputDecoration(
                      hintText: "Buscar...",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                ),
              ),
              Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homepagePresenter.customers.length,
                    itemBuilder: (context, index) {
                      Customer customer = homepagePresenter.customers[index];
                      return CustomerCard(
                        customer: customer,
                        onTapCustomer: (p0) => onTapCustomer(p0),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
