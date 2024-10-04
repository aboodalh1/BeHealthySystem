import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/app_router.dart';
import 'package:qrreader/core/util/asset_loader.dart';

import '../../../../../../constant.dart';


class TabletDrawer extends StatelessWidget {
  const TabletDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: kPrimaryColor,
          height: double.infinity,
          width: 120.w,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 15.h),
                child: Text("Be Healthy",style: TextStyle(
                  fontSize: 14.sp,color: Colors.white
                ),),
              ),
              TabletCustomTextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.kHomePage);
                },
                icon: Icons.home_filled,
                title: 'Home',
              ),
              TabletCustomTextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.kCustomerPage);
                },
                icon: Icons.person,
                title: 'Customers',
              ),
              TabletCustomTextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.kUsersPage);
                },
                icon: Icons.drive_eta_rounded,
                title: 'Users',
              ),
              TabletCustomTextButton(
                icon: Icons.report,
                title: 'Reports',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.kReportsPage);
                },
              ),
              TabletCustomTextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.kBagsPage);
                },
                icon: Icons.shopping_bag_rounded,
                title: 'Bags',
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  height: 0.2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TabletCustomTextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.kSignInPage);
                  },
                  title: "Sign out",
                  icon: Icons.login,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class TabletCustomTextButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const TabletCustomTextButton(
      {super.key,
        required this.title,
        required this.icon,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextButton(
          onPressed: onPressed ,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 10.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              )
            ],
          )),
    );
  }
}
