import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/core/util/asset_loader.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/core/widgets/desktop_drawer.dart';
import 'package:qrreader/feature/bags/presentation/manger/bags_cubit.dart';
import 'package:qrreader/feature/bags/presentation/widgets/custom_add_bags_button.dart';

import '../../../../../constant.dart';

class DesktopAddBagsPage extends StatelessWidget {
  const DesktopAddBagsPage({super.key, required this.bagsCubit});
  final BagsCubit bagsCubit;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return BlocConsumer<BagsCubit, BagsState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DesktopDrawer(),
          Expanded(child:
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.43),
                  border: Border.all(color: kPrimaryColor, width: 3),
                ),
                margin: EdgeInsets.only(top: 150,left: 300,right: 300),
                padding: EdgeInsets.symmetric(vertical: 50 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsLoader.bags),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Quantity',style: TextStyle(color: kPrimaryColor,fontSize: 20,),),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_up)),
                            SizedBox(height:20,width:60,child: TextField(
                              style: TextStyle(height: 1,fontSize: 18,color: kPrimaryColor),
                              cursorColor: kPrimaryColor,
                              controller: TextEditingController(text: '1'),
                              textAlign: TextAlign.center,
                              cursorHeight: 20,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hoverColor: kPrimaryColor,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
                              ),
                            )),
                            IconButton(onPressed: (){
                              bagsCubit.increaseBagsCounter();
                            }, icon: Icon(Icons.keyboard_arrow_down))
                          ],
                        )
                      ]

                    )
                  ]
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 300.0),
                child: Row(
                  children: [
                    Container(
                        width:ScreenSizeUtil.screenWidth*0.15,
                        child: CustomAddBagsButton(title: 'Done', onPressed: (){}, doneOrCancel: true)),
                    Spacer(),
                    Container(
                        width:ScreenSizeUtil.screenWidth*0.15,
                        child: CustomAddBagsButton(title: 'Cancel', onPressed: (){}, doneOrCancel: false, )),
                  ],
                ),
              )
            ],
          ))
        ],
      )
    );
  },
);
  }
}