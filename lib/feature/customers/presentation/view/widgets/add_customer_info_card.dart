import 'package:flutter/material.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/core/widgets/custom_under_line_field.dart';

import '../../../../../constant.dart';


class AddCustomerInformationCard extends StatelessWidget {
  const AddCustomerInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Container(
      height: 430,
      padding:
      const EdgeInsets.only(right: 10, left: 10, top: 35.32, bottom: 10),
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
          const CustomUnderLineTextField(hint: 'Full name'),
          const CustomUnderLineTextField(hint: 'Customer Num'),
          const CustomUnderLineTextField(hint: 'Driver'),
          const CustomUnderLineTextField(
            hint: 'Address',
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: ScreenSizeUtil.screenWidth*0.069,
                height: ScreenSizeUtil.screenWidth*0.02,
                child: ElevatedButton(
                  onPressed: () {},
                  child:  Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: ScreenSizeUtil.screenWidth*0.007,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                      MaterialStateProperty.all(kPrimaryColor)),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: ScreenSizeUtil.screenWidth*0.07,
                height: ScreenSizeUtil.screenWidth*0.02,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: ScreenSizeUtil.screenWidth*0.007,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor:
                      MaterialStateProperty.all(kUnsubsicriber)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
