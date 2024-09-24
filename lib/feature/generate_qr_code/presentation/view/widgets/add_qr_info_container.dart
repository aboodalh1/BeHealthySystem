import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/util/screen_util.dart';
import '../../../../Auth/presentation/view/widgets/custom_text_field.dart';
import '../../manger/generate_qr_cubit.dart';

class AddQrInfoContaier extends StatelessWidget {
  const AddQrInfoContaier({
    super.key,
    required this.generateQrCubit,
  });

  final GenerateQrCubit generateQrCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSizeUtil.screenHeight * 0.6,
      width: ScreenSizeUtil.screenWidth * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.8),
        border: Border.all(width: 3, color: kPrimaryColor),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 3.36,
              color: Colors.black.withOpacity(0.25))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(color: Color(0xffF2F2F2)),
            height: 200,
            width: 200,
            child: const Center(
                child: Text(
                  "Fill the Fields to generate QR",
                  textAlign: TextAlign.center,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: ScreenSizeUtil.screenWidth * 0.15,
                  child: CustomTextField(
                      isTablet: false,
                      controller: generateQrCubit.customerNameController,
                      label: 'Customer Name'),
                ),
                SizedBox(
                  width: 41,
                ),
                Container(
                  width: ScreenSizeUtil.screenWidth * 0.15,
                  child: CustomTextField(
                      isTablet: false,
                      controller: generateQrCubit.bagIDController,
                      label: 'Bag ID'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              generateQrCubit.generateQr(context);
            },
            child: const Text(
              'Generate',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor),
            ),
            style: ButtonStyle(
                surfaceTintColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 50)),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(16.34),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}