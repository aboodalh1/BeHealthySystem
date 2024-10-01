import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/core/util/app_router.dart';
import 'package:qrreader/core/util/function/navigation.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/core/widgets/desktop_drawer.dart';
import 'package:qrreader/feature/bags/presentation/manger/bags_cubit.dart';
import 'package:qrreader/feature/bags/presentation/view/add_bags_page/add_bags_page_view.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_search_bar.dart';

import '../widgets/bags_item.dart';

class DesktopBagsPage extends StatelessWidget {
  const DesktopBagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return BlocConsumer<BagsCubit, BagsState>(
  listener: (context, state) {},
  builder: (context, state) {
    final BagsCubit bags = context.read<BagsCubit>();
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DesktopDrawer(),
          Expanded(child:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0,right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: ScreenSizeUtil.screenWidth*0.25,),
                      Spacer(),
                      Container(width: ScreenSizeUtil.screenWidth*0.15,child: CustomSearchBar()),
                      Spacer(),
                      Container(width: ScreenSizeUtil.screenWidth*0.12,child: CustomElevatedButton(title: 'Add Bags', onPressed: (){
                      navigateTo(context, AddBagsPageView(bagsCubit: bags,));
                      }, fill: true))
                    ],
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: ScreenSizeUtil.screenHeight*0.9,
                    child: GridView.builder(
                      itemCount: 10,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5,mainAxisExtent: 190),
                        itemBuilder: (context,index)=>index%2==0?AvailableBagsItem():UnAvailableBagsItem()),
                  )
                ],
              ),
            ),
          ))
        ],
      )
    );
  },
);
  }
}

