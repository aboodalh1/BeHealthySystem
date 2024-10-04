import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';

import '../../../../../../constant.dart';
import 'mobile_custom_underline_field.dart';

class MobileAddCustomerInformationCard extends StatelessWidget {
  const MobileAddCustomerInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Container(
      width: 140.w,
      height: 220.h,
      padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 10, bottom: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.83)),
          border: Border.symmetric(
              horizontal: BorderSide(
                width: 2,
                color: kPrimaryColor,
              ),
              vertical: BorderSide(width: 5, color: kPrimaryColor)),
          color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              Container(
                  height: 15,
                  width: 40.w,
                  child: CustomElevatedButton(title: 'Save', onPressed: (){}, fill: true,))
            ] ,
          ),
          Icon(
            Icons.person,
            size: 20.sp,
          ),
          const MobileCustomUnderLineTextField(hint: 'Full name'),
          const MobileCustomUnderLineTextField(hint: 'Customer Num'),
          const MobileCustomUnderLineTextField(hint: 'Driver'),
          const MobileCustomUnderLineTextField(
            hint: 'Address',
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 50.w,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                          MaterialStateProperty.all(kPrimaryColor)),
                  child: Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: 6.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Container(
                height: 20,
                width: 50.w,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                          MaterialStateProperty.all(kUnsubsicriber)),
                  child: Text(
                    'Unsubscriber',
                    style: TextStyle(
                        fontSize: 6.sp,
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
