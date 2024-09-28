import 'package:flutter/material.dart';

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
      height: ScreenSizeUtil.screenWidth * 0.07,
      width: ScreenSizeUtil.screenWidth * 0.2,
      child: TextFormField(
        style: TextStyle(fontSize:8,height: 3),
        decoration:
        InputDecoration(hintText: hint, hintStyle:TextStyle(fontSize: ScreenSizeUtil.screenWidth*0.025,height: 0.2),border: UnderlineInputBorder()),
      ),
    );
  }
}
