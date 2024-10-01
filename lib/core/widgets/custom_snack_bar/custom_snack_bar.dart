import 'package:flutter/material.dart';
import 'package:qrreader/constant.dart';


void customSnackBar(context,String text){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      width: 400,
      backgroundColor: kPrimaryColor,
      content: Text(text, style: TextStyle(fontSize:18),),
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsetsDirectional.all(10),

    ),
  );
}