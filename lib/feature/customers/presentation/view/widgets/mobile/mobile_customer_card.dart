import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';

import '../../../../../../constant.dart';
import 'mobile_add_customer_info_card.dart';

class MobileCustomerCard extends StatelessWidget {
  const MobileCustomerCard({
    super.key, required this.customerCubit
  });
  final CustomerCubit customerCubit;
  @override
  Widget build(BuildContext context) {
    return customerCubit.isEdit? MobileAddCustomerInformationCard(): Container(
      height: 220.h,
      width: 140.w,
      padding:
      EdgeInsets.only(right: 2.w, left: 2.w, top: 10.h, bottom: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.83)),
          border: Border.symmetric(
              horizontal: BorderSide(width: 2, color: kPrimaryColor),
              vertical: BorderSide(width: 5, color: kPrimaryColor)),
          color: Colors.white),
      child: Column(
        children: [
          SizedBox(height: ScreenSizeUtil.screenWidth*0.02,),
           Icon(
            Icons.person,
            size: 20.sp,
          ),
          SizedBox(
            height: 12.36.h,
          ),
           Text(
            'Taim Hasan',
            style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5.21.h,
          ),
           Text(
            'Number Cus: 096 6554 253',
            style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20.sp
          ),
          SizedBox(
            height: 25.h ,
            width: 50.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h)),
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
              child:  Text(
                'Subscriber',
                style: TextStyle(
                    fontSize: 6.sp,
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
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.sp,),
          ),
          SizedBox(
            height: 3.h,
          ),
           Text('Address : Damascus',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 8.sp,)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                customerCubit.changeToEditCard();
                },
                child: Center(
                    child: Container(
                      padding: EdgeInsets.all(2).w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: kPrimaryColor,width: 2)
                      ),
                      child: Icon(
                        Icons.edit,
                        color: kPrimaryColor,
                        size: 10.sp,
                      ),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
