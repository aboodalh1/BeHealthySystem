import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/feature/generate_qr_code/presentation/manger/generate_qr_cubit.dart';
import 'package:qrreader/feature/generate_qr_code/presentation/view/widgets/add_qr_info_container.dart';
import 'package:qrreader/feature/generate_qr_code/presentation/view/widgets/generated_qr_container.dart';

class GenerateQRPage extends StatelessWidget {
  const GenerateQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenerateQrCubit(),
      child: BlocConsumer<GenerateQrCubit, GenerateQrState>(
        listener: (context, state) {},
        builder: (context, state) {
          GenerateQrCubit generateQrCubit = context.read<GenerateQrCubit>();
          return Scaffold(
            body: Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(40),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(23.2),
                    ),
                    child: const Text(
                      'Generate QR',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    )),
                const SizedBox(
                  height: 20,
                ),
                generateQrCubit.isGenerateQr
                    ? GeneratedQrContainer(generateQrCubit: generateQrCubit)
                    : AddQrInfoContaier(generateQrCubit: generateQrCubit),
                const SizedBox(height: 20,),
                generateQrCubit.isGenerateQr? ElevatedButton(
                  onPressed: () {
                    generateQrCubit.clearQr();
                  },
                  style: ButtonStyle(
                      surfaceTintColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: const BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(16.34),
                        ),
                      )),
                  child: const Text(
                    'Clear',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kPrimaryColor),
                  ),
                ):Container(),
                const Spacer(),
                generateQrCubit.isGenerateQr? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        generateQrCubit.printContainer();
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.8),
                            ),
                          )),
                      child: const Text(
                        'Print',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ):Container()
               ],
            ),
          );
        },
      ),
    );
  }
}


