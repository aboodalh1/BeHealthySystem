import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/feature/home_page/presentation/manger/home_cubit.dart';
import 'package:qrreader/feature/home_page/presentation/view/desktop_home_page.dart';
import 'package:qrreader/feature/home_page/presentation/view/mobile_home_page.dart';
import 'package:qrreader/feature/home_page/presentation/view/tablet_home_page.dart';

import '../../../../core/util/screen_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return LayoutBuilder(builder: (context, constraints) {
      if (ScreenSizeUtil.screenWidth <= 600) {
        return BlocProvider(
          create: (context) => HomeCubit(),
          child: const MobileHomePage(),
        );
      }
      if (ScreenSizeUtil.screenWidth <= 1000) {
        return BlocProvider(
          create: (context) => HomeCubit(),
          child:  TabletHomePage(context: context,),
        );
      } else {
        return BlocProvider(
          create: (context) => HomeCubit(),
          child:  DesktopHomePage(context: context),
        );

      }
    });
  }
}
