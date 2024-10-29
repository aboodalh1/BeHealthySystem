import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/core/util/function/navigation.dart';
import 'package:qrreader/dashboard.dart';
import 'package:qrreader/feature/generate_qr_code/presentation/manger/generate_qr_cubit.dart';
import 'package:qrreader/feature/generate_qr_code/presentation/view/widgets/add_qr_info_container.dart';
import 'package:qrreader/feature/generate_qr_code/presentation/view/widgets/generated_qr_container.dart';
import '../../../../core/widgets/custom_snack_bar/custom_snack_bar.dart';

class DesktopGenerateQRPage extends StatelessWidget {
  const DesktopGenerateQRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenerateQrCubit, GenerateQrState>(
      listener: (context, state) {
        if (state is GenerateQrSuccessState) {
          customSnackBar(context, state.message);
        }
        if (state is GetDriversFailureState) {
          customSnackBar(context, state.error, color: kOnWayColor);
        }
      },
      builder: (context, state) {
        if(state is GenerateQrFailureState){
          return Scaffold(
            appBar: AppBar(
              title: const Text('Generate QR'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  context.read<GenerateQrCubit>().clearQr();
                  navigateAndFinish(context, const DashboardPage(startRoute: 'home',));
                },
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svg/connection_problem.svg'),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    state.error,
                    style: TextStyle(fontSize: 6.sp),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero)),
                          backgroundColor:
                          MaterialStateProperty.all(kPrimaryColor)),
                      onPressed: () {
                        context.read<GenerateQrCubit>().clearQr();
                      },
                      child: Text(
                        "Try Again",
                        style: TextStyle(color: Colors.white, fontSize: 6.sp),
                      ))
                ],
              ),
            ),
          );
        }

        if (state is GenerateQrLoadingState || state is PrintContainerLoadingState ) {
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
        GenerateQrCubit generateQrCubit = context.read<GenerateQrCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Generate QR'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                generateQrCubit.clearQr();
                navigateAndFinish(context, const DashboardPage(startRoute: 'home',));
              },
            ),
          ),
          body: SingleChildScrollView(
            // Added Scrollable behavior
            child: Padding(
              // Added padding for consistent spacing
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Container(
                    width: 60.w,
                    height: 40,
                    margin:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(23.2),
                    ),
                    child: const Center(
                      child: Text(
                        'Generate QR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if(generateQrCubit.isGenerateQr && state is GenerateQrSuccessState)GeneratedQrContainer(generateQrCubit: generateQrCubit)
                  else AddQrInfoContainer(generateQrCubit: generateQrCubit),
                  const SizedBox(height: 20),
                  generateQrCubit.isGenerateQr
                      ? ElevatedButton(
                          onPressed: () {
                            generateQrCubit.clearQr();
                          },
                          style: ButtonStyle(
                            surfaceTintColor:
                                MaterialStateProperty.all(Colors.white),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(horizontal: 50)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                side: const BorderSide(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(16.34),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                            ),
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 20),
                  generateQrCubit.isGenerateQr
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                generateQrCubit.printContainer(bagID: generateQrCubit.generateQrModel.data.bagId
                                ,name: generateQrCubit.generateQrModel.data.customerName
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kPrimaryColor),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.8),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Print',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}