import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/constant.dart';

import '../../../../../../core/util/screen_util.dart';


class MobileCustomUnderLineTextField extends StatelessWidget {
  const MobileCustomUnderLineTextField({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 10.w,),
      child: TextFormField(
        style: TextStyle(fontSize:10.sp),
        cursorColor: kPrimaryColor,
        decoration:
        InputDecoration(
          focusColor: kPrimaryColor,
            hintText: hint, hintStyle:TextStyle(fontSize: 8.sp),border: UnderlineInputBorder()),
      ),
    );
  }
}
