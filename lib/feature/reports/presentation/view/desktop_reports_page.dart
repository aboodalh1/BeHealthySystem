import 'package:flutter/material.dart';

import '../../../../core/widgets/desktop_drawer.dart';

class DesktopReportsPage extends StatelessWidget {
  const DesktopReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DesktopDrawer(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 45.0, right: 20),
                child: Center(child: Text("Coming soon"),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
