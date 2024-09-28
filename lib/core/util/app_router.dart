import 'package:flutter/material.dart';
import 'package:qrreader/feature/Auth/presentation/view/sign_in_page.dart';
import 'package:qrreader/feature/bags/presentation/view/bags_page_view.dart';
import 'package:qrreader/feature/customers/presentation/view/customer_page_view.dart';
import 'package:qrreader/feature/generate_qr_code/presentation/view/generate_qr_page.dart';
import 'package:qrreader/feature/reports/presentation/view/reports_page.dart';
import 'package:qrreader/feature/users/presentation/view/users_page.dart';

import '../../feature/home_page/presentation/view/home_page.dart';

class AppRoutes{
  static const kHomePage = 'home_page';
  static const kSignInPage = 'sign_in_page';
  static const kCustomerPage = 'customer_page';
  static const kUsersPage = 'users_page';
  static const kReportsPage = 'reports_page';
  static const kGenerateQR = 'generate_qr';
  static const kBagsPage = 'bags_page';
  static  final  Map<String, WidgetBuilder> routes = {
    'home_page': (context)=>const HomePage(),
    'sign_in_page': (context)=>const SignInPage(),
    'customer_page': (context)=>CustomerPageView(),
    'users_page': (context)=>UsersPage(),
    'reports_page': (context)=>ReportsPage(),
    'generate_qr':(context)=>GenerateQRPage(),
    'bags_page':(context)=>BagsPageView()

  };
}