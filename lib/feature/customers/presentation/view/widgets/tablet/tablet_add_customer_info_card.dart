import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/customers/presentation/view/widgets/tablet/tablet_custom_underline_field.dart';

import '../../../../../../constant.dart';



class TabletAddCustomerInformationCard extends StatelessWidget {
  const TabletAddCustomerInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Container(
      height: 440.h,
      width: 390.w,
      padding:
      EdgeInsets.only(right: 5.w, left: 5.w, top: 20.h, bottom: 10.h),
      margin:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14.83)),
          border: Border.all(width: 2, color: kPrimaryColor),
          color: Colors.white),
      child: Column(
        children: [
          Icon(
            Icons.person,
            size: 16.sp,
          ),
          const TabletCustomUnderLineTextField(hint: 'Full name'),
          const TabletCustomUnderLineTextField(hint: 'Customer Num'),
          const TabletCustomUnderLineTextField(hint: 'Driver'),
          const TabletCustomUnderLineTextField(
            hint: 'Address',
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30.w,
                height: 25.h,
                child: ElevatedButton(
                  onPressed: () {},
                  child:  Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: 3.5.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                      MaterialStateProperty.all(kPrimaryColor)),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                width: 30.w,
                height: 25.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                      MaterialStateProperty.all(kUnsubsicriber)),
                  child: Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: 3.5.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
