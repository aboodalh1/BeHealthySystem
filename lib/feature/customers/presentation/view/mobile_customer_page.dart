import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/feature/customers/presentation/view/widgets/mobile/mobile_customer_grid.dart';
import 'package:qrreader/feature/home_page/presentation/view/mobile_home_page.dart';
import '../../../../constant.dart';
import '../../../../core/util/screen_util.dart';
import '../manger/customer_cubit.dart';

class MobileCustomerPage extends StatelessWidget {
  const MobileCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerCubit(),
      child: BlocConsumer<CustomerCubit, CustomerState>(
          listener: (context, state) {},
          builder: (context, state) {
            CustomerCubit customerCubit = context.read();
            return Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
              ),
              drawer: CustomMobileDrawer(),
              body: Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0.h, right: 10.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 160.w,
                              child: TextFormField(
                                  style: TextStyle(height: 1.2, fontSize: 10),
                                  decoration: const InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Search',
                                      hintStyle: TextStyle(height: 0.8),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(11),
                                          )))),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shadowColor: MaterialStateProperty.all(null),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.black),
                                      borderRadius:
                                          BorderRadius.circular(8.8.r),
                                    ),
                                  )),
                              child: Text(
                                'Select',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        MobileCustomerGrid(
                          customerCubit: customerCubit,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
