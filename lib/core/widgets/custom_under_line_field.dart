import 'package:flutter/material.dart';

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
      height: ScreenSizeUtil.screenWidth * 0.031,
      width: ScreenSizeUtil.screenWidth * 0.1,
      child: TextFormField(
        decoration:
        InputDecoration(hintText: hint, hintStyle:TextStyle(fontSize: ScreenSizeUtil.screenWidth*0.008),border: UnderlineInputBorder()),
      ),
    );
  }
}
