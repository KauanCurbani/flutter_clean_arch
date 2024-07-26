import 'package:delivery_flutter/core/customers/customer.dart';
import 'package:delivery_flutter/shared/format_cnpj_or_cpf.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.customer,
    required this.onTapCustomer,
  });

  final Customer customer;
  final Function(Customer) onTapCustomer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapCustomer(customer);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor.withAlpha(50),
            ),
          ),
        ),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    "${customer.externalCode} • ${customer.name}",
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Text(
              formatCnpjOrCpf(customer.cnpj),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (customer.activityBranchName != null)
              Text(
                customer.activityBranchName!,
                style: Theme.of(context).textTheme.labelLarge,
              ),
          ],
        ),
      ),
    );
  }
}
