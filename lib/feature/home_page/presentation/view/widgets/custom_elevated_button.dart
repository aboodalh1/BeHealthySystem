import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.title, required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kSecondaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.8),
            ),
          )),
      child:  Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w200, color: Colors.white),
      ),
    );
  }
}
