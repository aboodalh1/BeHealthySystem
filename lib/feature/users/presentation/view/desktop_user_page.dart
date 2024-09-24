import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrreader/core/util/screen_util.dart';

import '../../../customers/presentation/view/widgets/customer_grid.dart';
import '../../../home_page/presentation/view/widgets/custom_elevated_button.dart';
import '../../../home_page/presentation/view/widgets/custom_search_bar.dart';

class DesktopUsersPage extends StatelessWidget {
  const DesktopUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return const Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 45.0,right: 20),
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}




