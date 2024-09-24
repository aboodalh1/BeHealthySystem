import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';

import 'add_customer_info_card.dart';
import 'customer_card.dart';

class CustomerGrid extends StatelessWidget {
  const CustomerGrid({
    super.key, required this.customerCubit,
  });
  final CustomerCubit customerCubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCubit, CustomerState>(
  listener: (context, state) {},
  builder: (context, state) {
    return SizedBox(
      height: 1000,
      width: 1000,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 50,
            mainAxisSpacing: 20,
            childAspectRatio: 2.2 / 3),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) =>
        index == 0 ? const AddCustomerInformationCard() : CustomerCard(customerCubit: customerCubit,),
      ),
    );
  },
);
  }
}

