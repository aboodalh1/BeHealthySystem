import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:150.w,
                height: 360.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.43),
                  border: Border.all(color: kPrimaryColor, width: 3),
                ),
                padding: EdgeInsets.symmetric(vertical: 30.h ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsLoader.bags,width: 160.w,height: 160.h,),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Quantity',style: TextStyle(color: kPrimaryColor,fontSize: 8.sp,),),
                        SizedBox(width: 20.h,),
                        Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_up,size: 5.sp,)),
                            SizedBox(height:20.h,width:20.w,child: TextField(
                              style: TextStyle(height: 0.2.h,fontSize: 6.sp,color: kPrimaryColor),
                              cursorColor: kPrimaryColor,
                              controller: TextEditingController(text: '1'),
                              textAlign: TextAlign.center,
                              cursorHeight: 10.h,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hoverColor: kPrimaryColor,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 5.w),
                              ),
                            )),
                            IconButton(onPressed: (){
                              bagsCubit.increaseBagsCounter();
                            }, icon: Icon(Icons.keyboard_arrow_down,size: 5.sp,))
                          ],
                        )
                      ]

                    )
                  ]
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Row(
                  children: [
                    Container(
                        width:50.w,
                        child: CustomAddBagsButton(title: 'Done', onPressed: (){}, doneOrCancel: true)),
                    Spacer(),
                    Container(
                        width:50.w,
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