import 'package:flutter/material.dart';
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
            height: 430,
            padding:
                const EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 10),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14.83)),
                border: Border.symmetric(
                    horizontal: BorderSide(width: 2.5, color: kPrimaryColor),
                    vertical: BorderSide(width: 20, color: kPrimaryColor)),
                color: Colors.white),
            child: Column(
              children: [
                SizedBox(
                  height: ScreenSizeUtil.screenWidth * 0.03,
                ),
                Icon(
                  Icons.person,
                  size: ScreenSizeUtil.screenWidth * 0.05,
                ),
                const SizedBox(
                  height: 12.36,
                ),
                Text(
                  'Taim Hasan',
                  style: TextStyle(
                      fontSize: ScreenSizeUtil.screenWidth * 0.02,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 5.21,
                ),
                Text(
                  'Number Cus: 096 6554 253',
                  style: TextStyle(
                      fontSize: ScreenSizeUtil.screenWidth * 0.01,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: ScreenSizeUtil.screenWidth * 0.01,
                ),
                Container(
                  height: ScreenSizeUtil.screenWidth * 0.018,
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
                  height: ScreenSizeUtil.screenWidth * 0.015,
                ),
                Text(
                  'Driver : Saad Ph',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenSizeUtil.screenWidth * 0.01,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text('Address : Damascus',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenSizeUtil.screenWidth * 0.009,
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
                          size: ScreenSizeUtil.screenWidth * 0.01,
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
