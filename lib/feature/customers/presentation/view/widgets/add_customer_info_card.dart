import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/core/widgets/custom_under_line_field.dart';

import '../../../../../constant.dart';
import '../../../../home_page/presentation/view/widgets/custom_elevated_button.dart';
import '../../manger/customer_cubit.dart';


class AddCustomerInformationCard extends StatelessWidget {
  const AddCustomerInformationCard({super.key, required this.customerCubit});
  final CustomerCubit customerCubit;
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
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(width: 2, color: kPrimaryColor),
          color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              SizedBox(
                  height: 20,
                  width: 20.w,
                  child: CustomElevatedButton(platform: 'desktop',title: 'Save', onPressed: (){ customerCubit.changeToEditCard();}, fill: true,))
            ] ,
          ),
          Icon(
            Icons.person,
            size: 16.sp,
          ),
          const CustomUnderLineTextField(hint: 'Full name'),
          const CustomUnderLineTextField(hint: 'Customer Num'),
          const CustomUnderLineTextField(hint: 'Driver'),
          const CustomUnderLineTextField(
            hint: 'Address',
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20.w,
                height: 25,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                      MaterialStateProperty.all(kPrimaryColor)),
                  child:  Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: 2.5.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                width: 20.w,
                height: 25,child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                      MaterialStateProperty.all(kUnsubsicriber)),
                  child: Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: 2.5.sp,
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
