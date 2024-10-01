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
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 10,),
      child: TextFormField(
        cursorRadius: Radius.circular(21),
        style: TextStyle(fontSize:12,height: 3),
        decoration:
        InputDecoration(hintText: hint, hintStyle:TextStyle(fontSize: ScreenSizeUtil.screenWidth*0.022),border: UnderlineInputBorder()),
      ),
    );
  }
}
