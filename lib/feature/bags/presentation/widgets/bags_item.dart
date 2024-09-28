import 'package:flutter/material.dart';

import '../../../../constant.dart';
import '../../../../core/util/asset_loader.dart';

class AvailableBagsItem extends StatelessWidget {
  const AvailableBagsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsLoader.availableBag),
        SizedBox(height: 10,),
        Text('ID: 314423 \n Available',textAlign: TextAlign.center,style: TextStyle(color: kPrimaryColor),),
        SizedBox(height: 10,),
      ],
    );
  }
}
class UnAvailableBagsItem extends StatelessWidget {
  const UnAvailableBagsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetsLoader.unAvailableBag),
        SizedBox(height: 10,),
        Text('ID: 314423 \n Available',textAlign: TextAlign.center,style: TextStyle(color: kUnsubsicriber),),
        SizedBox(height: 10,),
      ],
    );
  }
}
