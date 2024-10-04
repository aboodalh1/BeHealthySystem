import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';

class NewCustomerCard extends StatelessWidget {
  const NewCustomerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      width: 390.w,
      padding:
      EdgeInsets.only(right: 5.w, left: 5.w, top: 20.h, bottom: 10.h),
      margin:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14.83)),
          border: Border.all(color: kPrimaryColor, width: 2),
          color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kSecondaryColor),
              child:  IconButton(
                onPressed: (){
                },
                icon:Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 15.sp
                )
                )
            ),
            SizedBox(
              height: 20.h,
            ),
             Text(
              'Add a new customer',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 3.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
