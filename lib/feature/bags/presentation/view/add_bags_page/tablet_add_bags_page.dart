import 'package:flutter/material.dart';
import 'package:qrreader/core/util/screen_util.dart';

import '../../../../../constant.dart';
import '../../../../../core/widgets/tablet/tablet_custom_search_field.dart';
import '../../../../home_page/presentation/view/desktop_home_page.dart';
import '../../../../home_page/presentation/view/widgets/custom_elevated_button.dart';
import '../../widgets/bags_item.dart';


class TabletAddBagsPage extends StatelessWidget {
  const TabletAddBagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Scaffold(
        appBar: AppBar(backgroundColor: kPrimaryColor,),
        drawer: Row(
          children: [
            Container(
              color: kPrimaryColor,
              height: double.infinity,
              width: ScreenSizeUtil.screenWidth * 0.3,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Be Healthy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                  ),
                  const SizedBox(
                    height: 40,
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
        ),
        body: Expanded(child:
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 38.0,right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: ScreenSizeUtil.screenWidth*0.25,),
                    const Spacer(),
                    const TabletCustomSearchBar(),
                    const Spacer(),
                    Container(width: ScreenSizeUtil.screenWidth*0.18,child: CustomElevatedButton(platform: 'tablet',title: 'Add Bags', onPressed: (){}, fill: true))
                  ],
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: ScreenSizeUtil.screenHeight*0.9,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: 180),
                      itemBuilder: (context,index)=>index%2==0?const AvailableBagsItem():const UnAvailableBagsItem()),
                )
              ],
            ),
          ),
        ))
    );
  }
}
