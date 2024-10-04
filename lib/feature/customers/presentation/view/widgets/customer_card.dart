import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';
import 'package:qrreader/feature/customers/presentation/view/widgets/add_customer_info_card.dart';

import '../../../../../constant.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key, required this.customerCubit
  });
  final CustomerCubit customerCubit;
  @override
  Widget build(BuildContext context) {
    return customerCubit.isEdit? AddCustomerInformationCard(customerCubit: customerCubit,): Container(
      height: 440,
      width: 390.w,
      padding:
      EdgeInsets.only(right: 5.w, left: 5.w, top: 20.h, bottom: 10.h),
      margin:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.83)),
          border: Border.symmetric(
              horizontal: BorderSide(width: 2.5, color: kPrimaryColor),
              vertical: BorderSide(width: 20, color: kPrimaryColor)),
          color: Colors.white),
      child: Column(
        children: [
          SizedBox(height: ScreenSizeUtil.screenWidth*0.019,),
           Icon(
            Icons.person,
            size: 16.sp,
          ),
          SizedBox(
            height: 12.36.h,
          ),
           Text(
            'Taim Hasan',
            style: TextStyle(fontSize: 4.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 5.21.h,
          ),
           Text(
            'Number: 9266554253',
            style: TextStyle(fontSize: 3.sp, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 18.27.h,
          ),
          SizedBox(
            height: 25,
            width: 26.w,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
              child:  Text(
                'Subscriber',
                style: TextStyle(
                    fontSize: 3.sp,
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
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 3.sp,),
          ),
          SizedBox(
            height: 3.h,
          ),
           Text('Address : Damascus',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 3.sp,)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                customerCubit.changeToEditCard();
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child:  Center(
                      child: Icon(
                        Icons.edit,
                        color: kPrimaryColor,
                        size: ScreenSizeUtil.screenWidth*0.01,
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
