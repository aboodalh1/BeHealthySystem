import 'package:flutter/material.dart';
import 'package:qrreader/core/widgets/custom_under_line_field.dart';

import '../../../../../constant.dart';


class AddCustomerInformationCard extends StatelessWidget {
  const AddCustomerInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Icon(
            Icons.person,
            size: 70,
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
                width: 100,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(kPrimaryColor)),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Subscriber',
                    style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                  style: ButtonStyle(
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
