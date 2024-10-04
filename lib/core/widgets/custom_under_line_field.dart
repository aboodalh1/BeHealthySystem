import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/constant.dart';

import '../util/screen_util.dart';

class CustomUnderLineTextField extends StatelessWidget {
  const CustomUnderLineTextField({
    super.key,
    required this.hint,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Container(
      height: 40,
      width: 40.w,
      child: TextFormField(
        cursorColor: kPrimaryColor,
        decoration:
        InputDecoration(hintText: hint, hintStyle:TextStyle(fontSize: ScreenSizeUtil.screenWidth*0.008),border: UnderlineInputBorder()),
      ),
    );
  }
}
