import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';

import 'tablet_add_customer_info_card.dart';
import 'tablet_customer_card.dart';

class TabletCustomerGrid extends StatelessWidget {
  const TabletCustomerGrid({
    super.key, required this.customerCubit,
  });
  final CustomerCubit customerCubit;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return BlocConsumer<CustomerCubit, CustomerState>(
  listener: (context, state) {},
  builder: (context, state) {
    return SizedBox(
      height: 0.56*4*ScreenSizeUtil.screenHeight,
      width: 1000,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 30,
            mainAxisSpacing: 10,
            childAspectRatio: 2.2 / 3),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) =>
        index == 0 ? const TabletAddCustomerInformationCard() : TabletCustomerCard(customerCubit: customerCubit,),
      ),
    );
  },
);
  }
}

