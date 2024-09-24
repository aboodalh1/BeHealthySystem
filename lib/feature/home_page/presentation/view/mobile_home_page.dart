import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/feature/home_page/presentation/manger/home_cubit.dart';
import 'package:qrreader/feature/home_page/presentation/view/desktop_home_page.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(backgroundColor: kPrimaryColor,),
          drawer: Drawer(
            backgroundColor: kPrimaryColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Be Healthy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300)),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    CustomTextButton(
                      function: () {
                        homeCubit.currentIndex=0;
                      },
                      icon: Icons.home_filled,
                      title: 'Home',
                    ),
                    CustomTextButton(
                      function: () {
                        homeCubit.currentIndex=1;
                      },
                      icon: Icons.person,
                      title: 'Customers',
                    ),
                    CustomTextButton(
                      function: () {
                        homeCubit.currentIndex=2;
                      },
                      icon: Icons.report,
                      title: 'Reports',
                    ),
                    CustomTextButton(
                      function: () {
                        homeCubit.currentIndex=3;
                      },
                      icon: Icons.shopping_bag_rounded,
                      title: 'Bags',
                    ),
                    SizedBox(
                      height: 280,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Divider(
                        height: 0.2,
                      ),
                    ),
                    CustomTextButton(
                      function: () {},
                      title: "Sign out",
                      icon: Icons.login,
                    )
                  ],
                )
              ],
            ),
          ),
          body: homeCubit.screens[homeCubit.currentIndex],
        );
      },
    );
  }
}
