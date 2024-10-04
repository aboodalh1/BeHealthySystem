import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../Auth/presentation/view/widgets/tablet_widgets/tablet_custom_drawer.dart';

class TabletReportsPage extends StatelessWidget {
  const TabletReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      drawer: TabletDrawer(),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0, right: 20),
            child: Center(
              child: Text("Coming Soon"),
            ),
          ),
        ),
      ),
    );
  }
}
