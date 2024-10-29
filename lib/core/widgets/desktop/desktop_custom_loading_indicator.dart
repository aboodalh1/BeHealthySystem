import 'package:flutter/material.dart';

import '../../../constant.dart';
class DesktopLoadingIndicator extends StatelessWidget {
  const DesktopLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
