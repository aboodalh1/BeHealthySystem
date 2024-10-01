import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/feature/Auth/presentation/view/sign_in_page.dart';
import 'package:qrreader/feature/bags/presentation/manger/bags_cubit.dart';
import 'package:qrreader/feature/bags/presentation/view/bags_page_view.dart';
import 'package:qrreader/feature/customers/presentation/view/customer_page_view.dart';
import 'package:qrreader/feature/generate_qr_code/presentation/view/generate_qr_page.dart';
import 'package:qrreader/feature/reports/presentation/view/reports_page.dart';
import 'package:qrreader/feature/users/presentation/view/users_page.dart';

import '../../feature/bags/presentation/view/add_bags_page/add_bags_page_view.dart';
import '../../feature/home_page/presentation/view/home_page.dart';

class AppRoutes {
  static const kHomePage = 'home_page';
  static const kSignInPage = 'sign_in_page';
  static const kCustomerPage = 'customer_page';
  static const kUsersPage = 'users_page';
  static const kReportsPage = 'reports_page';
  static const kGenerateQR = 'generate_qr';
  static const kBagsPage = 'bags_page';
  static const kAddBagsPage = 'add_bags_page';
  static final Map<String, WidgetBuilder> routes = {
    'home_page': (context) => const HomePage(),
    'sign_in_page': (context) => const SignInPage(),
    'customer_page': (context) => CustomerPageView(),
    'users_page': (context) => UsersPage(),
    'reports_page': (context) => ReportsPage(),
    'generate_qr': (context) => GenerateQRPage(),
    'bags_page': (context) =>
        BlocProvider(
          create: (context) => BagsCubit(),
          child: BagsPageView(),
        ),
    'add_bags_page': (context) =>
        BlocProvider.value(
          value: context.read<BagsCubit>(),
          child: AddBagsPageView(bagsCubit: context.read<BagsCubit>()),
        ),

  };
}