import 'package:flutter/material.dart';
import 'package:qrreader/core/util/app_router.dart';

import '../../constant.dart';
import '../util/screen_util.dart';

class DesktopDrawer extends StatelessWidget {
  const DesktopDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Row(
      children: [
        Container(
          color: kPrimaryColor,
          height: double.infinity,
          width: ScreenSizeUtil.screenWidth * 0.22,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Be Healthy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.kHomePage);
                },
                icon: Icons.home_filled,
                title: 'Home',
              ),
              CustomTextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.kCustomerPage);
                },
                icon: Icons.person,
                title: 'Customers',
              ),
              CustomTextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.kUsersPage);
                },
                icon: Icons.drive_eta_rounded,
                title: 'Users',
              ),
              CustomTextButton(
                icon: Icons.report,
                title: 'Reports',
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.kReportsPage);
                },
              ),
              CustomTextButton(
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
                child: CustomTextButton(
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

class CustomTextButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomTextButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextButton(
          onPressed: onPressed ,
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
