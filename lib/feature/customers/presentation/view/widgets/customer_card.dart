import 'package:flutter/material.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/custom_under_line_field.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key, required this.customerCubit
  });
  final CustomerCubit customerCubit;
  @override
  Widget build(BuildContext context) {
    return customerCubit.isEdit? Container(
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
          CustomElevatedButton(title: 'Save', onPressed: () {  },),
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
    ): Container(
      height: 430,
      padding:
      const EdgeInsets.only(right: 10, left: 10, top: 35.32, bottom: 10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14.83)),
          border: Border.symmetric(
              horizontal: BorderSide(width: 2.5, color: kPrimaryColor),
              vertical: BorderSide(width: 20, color: kPrimaryColor)),
          color: Colors.white),
      child: Column(
        children: [
          const Icon(
            Icons.person,
            size: 80,
          ),
          const SizedBox(
            height: 12.36,
          ),
          const Text(
            'Taim Hasan',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5.21,
          ),
          const Text(
            'Number Cus: 096 6554 253',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 18.27,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
            child: const Text(
              'Subscriber',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(
            height: 30.45,
          ),
          const Text(
            'Driver : Saad Ph',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text('Address : Damascus',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                customerCubit.changeToEditCard();
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: const Center(
                      child: Icon(
                        Icons.edit,
                        color: kPrimaryColor,
                        size: 15,
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
