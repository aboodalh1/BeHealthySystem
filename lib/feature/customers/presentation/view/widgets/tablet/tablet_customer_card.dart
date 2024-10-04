import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';
import 'package:qrreader/feature/customers/presentation/view/widgets/tablet/tablet_add_customer_info_card.dart';

import '../../../../../../constant.dart';

class TabletCustomerCard extends StatelessWidget {
  const TabletCustomerCard({super.key, required this.customerCubit});

  final CustomerCubit customerCubit;

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return customerCubit.isEdit
        ? TabletAddCustomerInformationCard()
        : Container(
            height: 440.h,
            width: 390.w,
            padding:
                EdgeInsets.only(right: 5.w, left: 5.w, top: 20.h, bottom: 10.h),
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.83)),
                border: Border.symmetric(
                    horizontal: BorderSide(width: 2.5, color: kPrimaryColor),
                    vertical: BorderSide(width: 20, color: kPrimaryColor)),
                color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Icon(
                  Icons.person,
                  size: 16.sp,
                ),
                const SizedBox(
                  height: 12.36,
                ),
                Text(
                  'Taim Hasan',
                  style: TextStyle(
                      fontSize: 6.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.21.h,
                ),
                Text(
                  'Number Cus: 096 6554 253',
                  style: TextStyle(
                      fontSize: 4.5.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 25.h,
                  width: 35.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor)),
                    child: Text(
                      'Subscriber',
                      style: TextStyle(
                          fontSize: ScreenSizeUtil.screenWidth * 0.01,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Driver : Saad Ph',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 5.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text('Address : Damascus',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 5.sp,
                    )),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        customerCubit.changeToEditCard();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Icon(
                          Icons.edit,
                          color: kPrimaryColor,
                          size: 5.sp,
                        )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
