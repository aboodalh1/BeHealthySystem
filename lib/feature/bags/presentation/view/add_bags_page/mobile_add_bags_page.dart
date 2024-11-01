import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/util/asset_loader.dart';
import '../../manger/bags_cubit.dart';
import '../../widgets/custom_add_bags_button.dart';

class MobileAddBagsPage extends StatelessWidget {
  const MobileAddBagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BagsCubit, BagsState>(
      listener: (context, state) {},
      builder: (context, state) {
        BagsCubit bagsCubit = context.read<BagsCubit>();
        return Scaffold(
            appBar: AppBar(
              title: const Text("Edit Bags Number",),
              backgroundColor: kPrimaryColor,),
            body:   Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:200.w,
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
                  padding: EdgeInsets.symmetric(horizontal: 80.w),
                  child: Row(
                    children: [
                      SizedBox(
                          width:50.w,
                          child: CustomAddBagsButton(
                              fontSize: 7.sp,
                              title: 'Done', onPressed: (){}, doneOrCancel: true)),
                      const Spacer(),
                      SizedBox(
                          width:50.w,
                          child: CustomAddBagsButton(
                            fontSize: 7.sp,
                            title: 'Cancel', onPressed: (){}, doneOrCancel: false, )),
                    ],
                  ),
                )
              ],
            )
        );
      },
    );
  }
}
