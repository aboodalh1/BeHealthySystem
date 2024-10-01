import 'package:flutter/material.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/core/util/screen_util.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget ?suffixIcon;
  final bool isTablet;
  final bool isCenter;
  const CustomTextField(
      {super.key,required this.isTablet, required this.controller, required this.label, this.suffixIcon, required this.isCenter});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(23.6),
      shadowColor: Colors.black,
      elevation: 4,
      child: TextFormField(
          controller: controller,
          textAlign: isCenter? TextAlign.center:TextAlign.start,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              fillColor: const Color(0xFFf2f2f2),
              filled: true,
              hintText: label,
              hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontSize: isTablet? ScreenSizeUtil.screenWidth*0.015:16),
              focusColor: Colors.blue,
              enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(23.6),
                borderSide: BorderSide(width: 0.58,color: Colors.black.withOpacity(.20)),
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(23.6),
                borderSide: BorderSide(width: 0.58,color: Colors.black.withOpacity(.20)),
              ),
              floatingLabelStyle: const TextStyle(color: Colors.blue)),
          cursorColor: kPrimaryColor, ),
    );
  }
}
