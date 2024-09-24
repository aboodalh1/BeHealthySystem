import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/feature/users/presentation/manger/user_cubit.dart';
import 'package:qrreader/feature/users/presentation/view/desktop_user_page.dart';
import 'package:qrreader/feature/users/presentation/view/mobile_users_page.dart';
import 'package:qrreader/feature/users/presentation/view/tablet_users_page.dart';

import '../../../../core/util/screen_util.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return LayoutBuilder(builder: (context, constraints) {
      if (ScreenSizeUtil.screenWidth <= 600) {
        return BlocProvider(
          create: (context) => UserCubit(),
          child: const MobileUsersPage(),
        );
      }
      if (ScreenSizeUtil.screenWidth <= 1000) {
        return BlocProvider(
          create: (context) => UserCubit(),
          child: const TabletUsersPage(),
        );
      } else {
        return BlocProvider(
          create: (context) => UserCubit(),
          child: const DesktopUsersPage(),
        );

      }
    });
  }
}
