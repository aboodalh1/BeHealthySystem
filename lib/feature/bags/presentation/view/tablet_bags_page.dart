import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/core/util/function/navigation.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/bags/presentation/manger/bags_cubit.dart';
import 'package:qrreader/feature/bags/presentation/view/add_bags_page/add_bags_page_view.dart';

import '../../../../constant.dart';
import '../../../../core/widgets/tablet/tablet_custom_search_field.dart';
import '../../../home_page/presentation/view/desktop_home_page.dart';
import '../../../home_page/presentation/view/widgets/custom_elevated_button.dart';
import '../widgets/bags_item.dart';

class TabletBagsPage extends StatelessWidget {
  const TabletBagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return BlocConsumer<BagsCubit, BagsState>(
      listener: (context, state) {},
      builder: (context, state) {
        BagsCubit bagsCubit = context.read<BagsCubit>();
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
            ),
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
            body: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38.0, right: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: ScreenSizeUtil.screenWidth * 0.25,
                            ),
                            Spacer(),
                            TabletCustomSearchBar(),
                            Spacer(),
                            Container(
                                width: ScreenSizeUtil.screenWidth * 0.18,
                                child: CustomElevatedButton(
                                    platform: 'tablet',
                                    title: 'Add Bags',
                                    onPressed: () {
                                      navigateTo(context, AddBagsPageView(
                                          bagsCubit: bagsCubit));
                                     },
                                    fill: true))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: ScreenSizeUtil.screenHeight * 0.9,
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4, mainAxisExtent: 180),
                              itemBuilder: (context, index) =>
                              index % 2 == 0
                                  ? AvailableBagsItem()
                                  : UnAvailableBagsItem()),
                        )
                      ],
                    ),
                  ),
                )));
      },
    );
  }
}
