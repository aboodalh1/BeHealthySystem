import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';
import 'mobile_add_customer_info_card.dart';
import 'mobile_customer_card.dart';

class MobileCustomerGrid extends StatelessWidget {
  const MobileCustomerGrid({
    super.key, required this.customerCubit,
  });
  final CustomerCubit customerCubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCubit, CustomerState>(
  listener: (context, state) {},
  builder: (context, state) {
    return SizedBox(
      height: 4*360.h,
      width: 1000.w,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 280,
            crossAxisSpacing: 5.w,
            ),
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) =>
        index == 0 ? const MobileAddCustomerInformationCard() : MobileCustomerCard(customerCubit: customerCubit,),
      ),
    );
  },
);
  }
}

