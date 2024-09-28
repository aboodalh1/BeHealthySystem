import 'package:flutter/material.dart';
import 'package:qrreader/core/util/screen_util.dart';

import '../../../home_page/presentation/view/widgets/custom_elevated_button.dart';

class TabletBagsPage extends StatelessWidget {
  const TabletBagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Scaffold(
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
                    Spacer(),
                    Container(width: ScreenSizeUtil.screenWidth*0.15,child: CustomSearchBar()),
                    Spacer(),
                    Container(width: ScreenSizeUtil.screenWidth*0.12,child: CustomElevatedButton(title: 'Add Bags', onPressed: (){}, fill: true))
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: ScreenSizeUtil.screenHeight*0.9,
                  child: GridView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                      itemBuilder: (context,index)=>index%2==0?AvailableBagsItem():UnAvailableBagsItem()),
                )
              ],
            ),
          ),
        ))
    )
  }
}
