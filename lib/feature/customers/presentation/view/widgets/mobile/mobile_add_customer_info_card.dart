import 'package:flutter/material.dart';
import 'package:qrreader/core/util/screen_util.dart';

import '../../../../../../constant.dart';
import 'mobile_custom_underline_field.dart';



class MobileAddCustomerInformationCard extends StatelessWidget {
  const MobileAddCustomerInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Container(
      padding:
      const EdgeInsets.only(right: 10, left: 10, top: 18.32, bottom: 5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(14.83)),
          border: Border.all(width: 2, color: kPrimaryColor),
          color: Colors.white),
      child: Column(
        children: [
          Icon(
            Icons.person,
            size: ScreenSizeUtil.screenWidth * 0.05,
          ),
          const MobileCustomUnderLineTextField(hint: 'Full name'),
          const MobileCustomUnderLineTextField(hint: 'Customer Num'),
          const MobileCustomUnderLineTextField(hint: 'Driver'),
          const MobileCustomUnderLineTextField(
            hint: 'Address',
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ScreenSizeUtil.screenWidth*0.08,
                height: ScreenSizeUtil.screenWidth*0.025,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                      MaterialStateProperty.all(kPrimaryColor)),
                  child:  Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: ScreenSizeUtil.screenWidth*0.009,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: ScreenSizeUtil.screenWidth*0.08,
                height: ScreenSizeUtil.screenWidth*0.025,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                      MaterialStateProperty.all(kUnsubsicriber)),
                  child: Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: ScreenSizeUtil.screenWidth*0.008,
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
