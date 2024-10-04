import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';
import 'package:qrreader/feature/customers/presentation/view/widgets/new_customer_card.dart';

import 'add_customer_info_card.dart';
import 'customer_card.dart';

class CustomerGrid extends StatelessWidget {
  const CustomerGrid({
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
            mainAxisExtent: 360,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 20.h,
            ),
        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.w),
        itemBuilder: (context, index) =>
        index == 0 ? const NewCustomerCard() : CustomerCard(customerCubit: customerCubit,),
      ),
    );
  },
);
  }
}

