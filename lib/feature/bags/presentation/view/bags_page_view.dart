import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/feature/bags/presentation/manger/bags_cubit.dart';
import 'package:qrreader/feature/bags/presentation/view/desktop_bags_pag.dart';
import 'package:qrreader/feature/bags/presentation/view/mobile_bags_page.dart';
import 'package:qrreader/feature/bags/presentation/view/tablet_bags_page.dart';

import '../../../../core/util/screen_util.dart';

class BagsPageView extends StatelessWidget {
  const BagsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return LayoutBuilder(builder: (context,constraints){
      if (ScreenSizeUtil.screenWidth <= 600) {
        return BlocProvider(
          create: (context) => BagsCubit(),
          child: const MobileBagsPage(),
        );
      }
      if (ScreenSizeUtil.screenWidth <= 1000) {
        return BlocProvider(
          create: (context) => BagsCubit(),
          child:  const TabletBagsPage(),
        );
      } else {
        return BlocProvider(
          create: (context) => BagsCubit(),
          child:  const DesktopBagsPage(),
        );

      }
    });
  }
}
