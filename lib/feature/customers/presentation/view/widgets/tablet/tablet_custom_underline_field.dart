import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/util/screen_util.dart';


class TabletCustomUnderLineTextField extends StatelessWidget {
  const TabletCustomUnderLineTextField({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Container(
      height: 40.h,
      width: 55.w,
      child: TextFormField(
        decoration:
        InputDecoration(hintText: hint, hintStyle:TextStyle(fontSize: ScreenSizeUtil.screenWidth*0.012),border: UnderlineInputBorder()),
      ),
    );
  }
}
