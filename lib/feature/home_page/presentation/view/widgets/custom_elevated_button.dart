import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key, required this.title, required this.onPressed,  required this.fill, this.platform,
  });
  final String title;
  final bool fill;
  final VoidCallback onPressed;
   String? platform='desktop';
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(fill?kSecondaryColor: const Color(0xffF5F5F5)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: !fill?const BorderSide(width: 0.6,color: kPrimaryColor):BorderSide.none,
              borderRadius: BorderRadius.circular(fill?16.8:11),
            ),
          )),
      child:  Text(
        title,
        style: TextStyle(
            fontSize: platform=='desktop'?18:12, fontWeight: FontWeight.w300, color: fill?Colors.white:kPrimaryColor),
      ),
    );
  }
}
