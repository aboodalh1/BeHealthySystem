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
    return Container(
      width: ScreenSizeUtil.screenWidth * 0.1,
      child: TextFormField(
        decoration:
        InputDecoration(hintText: hint, border: UnderlineInputBorder()),
      ),
    );
  }
}
