import 'package:flutter/material.dart';
import 'package:qrreader/feature/Auth/presentation/view/sign_in_page.dart';

import '../../feature/home_page/presentation/view/home_page.dart';

class AppRoutes{
  static const kHomePage = 'home_page';
  static const kSignInPage = 'sign_in_page';
  static  final  Map<String, WidgetBuilder> routes = {
    'home_page': (context)=>const HomePage(),
    'sign_in_page': (context)=>const SignInPage(),
  };
}