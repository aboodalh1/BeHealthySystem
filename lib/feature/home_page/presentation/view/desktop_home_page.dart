import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';
import 'package:qrreader/feature/customers/presentation/view/desktop_customer_page.dart';
import 'package:qrreader/feature/home_page/presentation/view/tablet_home_page.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_search_bar.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({required BuildContext context, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          HomePageDrawer(),
          BlocProvider(
            create: (context) => CustomerCubit(),
            child: DesktopCustomerPage(),
          ),
        ],
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomElevatedButton(
                  title: 'Generate QR', onPressed: () {  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenSizeUtil.screenHeight * 0.05,
          ),
          const CustomSearchBar(),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSizeUtil.screenWidth * 0.02, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: ScreenSizeUtil.screenHeight * 0.06,
            width: ScreenSizeUtil.screenWidth * 0.65,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(4.85),
              color: const Color(0xffF5F5F5),
            ),
            child: Row(
              children: [
                SizedBox(
                    width: ScreenSizeUtil.screenWidth * 0.09,
                    child: customText(label: 'Driver Name')),
                SizedBox(
                    width: ScreenSizeUtil.screenWidth * 0.09,
                    child: customText(label: 'Driver ID')),
                SizedBox(
                    width: ScreenSizeUtil.screenWidth * 0.1,
                    child: customText(label: 'Customer Name')),
                SizedBox(
                    width: ScreenSizeUtil.screenWidth * 0.09,
                    child: customText(label: 'Bag ID')),
                customText(label: 'Status'),
                const Spacer(),
                SizedBox(
                    width: ScreenSizeUtil.screenWidth * 0.14,
                    child: customText(label: 'Date'))
              ],
            ),
          ),
          Container(
            width: ScreenSizeUtil.screenWidth * 0.65,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: ScreenSizeUtil.screenHeight * 0.06,
                      width: ScreenSizeUtil.screenWidth * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.85),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                              width: ScreenSizeUtil.screenWidth * 0.09,
                              child: customText(
                                  label: 'Driver Name AbdAllah',
                                  color: Colors.black)),
                          SizedBox(
                              width: ScreenSizeUtil.screenWidth * 0.09,
                              child: customText(
                                  label: 'Driver ID', color: Colors.black)),
                          SizedBox(
                              width: ScreenSizeUtil.screenWidth * 0.1,
                              child: customText(
                                  label: 'Customer Name Ahmad Deeb',
                                  color: Colors.black)),
                          SizedBox(
                              width: ScreenSizeUtil.screenWidth * 0.08,
                              child: customText(
                                  label: '151818911', color: Colors.black)),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(
                                  color: kAtCustomerColor,
                                  borderRadius: BorderRadius.circular(2.75)),
                              child: customText(
                                  label: 'At Customer', color: Colors.black)),
                          const Spacer(),
                          SizedBox(
                              width: ScreenSizeUtil.screenWidth * 0.14,
                              child: customText(
                                  label: '2024-06-05 10:55',
                                  color: Colors.black))
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: ScreenSizeUtil.screenWidth * 0.6,
                      height: ScreenSizeUtil.screenHeight * 0.0007,
                      decoration: const BoxDecoration(color: Colors.black),
                    ),
                itemCount: 6),
          )
        ],
      ),
    );
  }

  Text customText({required String label, color}) =>
      Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color == Colors.black ? Colors.black : kPrimaryColor,
            fontSize: ScreenSizeUtil.screenWidth < 1000 ? 16 : 14,
            fontWeight: FontWeight.w400),
      );
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback function;

  const CustomTextButton({super.key,
    required this.title,
    required this.icon,
    required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextButton(
          onPressed: function,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              )
            ],
          )),
    );
  }
}
