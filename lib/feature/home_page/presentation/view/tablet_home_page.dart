import 'package:flutter/material.dart';
import '../../../../constant.dart';
import '../../../../core/util/screen_util.dart';
import 'desktop_home_page.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({required BuildContext context, super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Drawer(
        child: HomePageDrawer(),
      ),
      body:  Expanded(child: HomePageBody()),
    );
  }
}

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({
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
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Be Healthy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300)),
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextButton(
                icon: Icons.home_filled,
                title: 'Home',
              ),
              CustomTextButton(
                icon: Icons.person,
                title: 'Customers',
              ),
              CustomTextButton(
                icon: Icons.report,
                title: 'Reports',
              ),
              CustomTextButton(
                icon: Icons.shopping_bag_rounded,
                title: 'Bags',
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Divider(
                  height: 0.2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: CustomTextButton(
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

  const CustomTextButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextButton(
          onPressed: () {},
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
