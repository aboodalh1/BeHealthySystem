import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/function/navigation.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/Auth/presentation/view/widgets/tablet_widgets/tablet_custom_drawer.dart';
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
            drawer: TabletDrawer(),
            body: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(top: 38.0.h, right: 20.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            Spacer(),
                            TabletCustomSearchBar(),
                            Spacer(),
                            Container(
                                width: 60.w,
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
