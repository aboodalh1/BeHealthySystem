import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/util/screen_util.dart';
import '../desktop_home_page.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                function: () {},
                icon: Icons.home_filled,
                title: 'Home',
              ),
              CustomTextButton(
                function: () {},
                icon: Icons.person,
                title: 'Customers',
              ),
              CustomTextButton(
                function: () {},
                icon: Icons.report,
                title: 'Reports',
              ),
              CustomTextButton(
                function: () {},
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
                  function: () {
                    Navigator.of(context).pushNamed('sign_in_page');
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
