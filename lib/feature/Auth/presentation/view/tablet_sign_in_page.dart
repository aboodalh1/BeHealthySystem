import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/core/util/function/navigation.dart';
import 'package:qrreader/feature/home_page/presentation/view/home_page.dart';

import '../../../../core/util/asset_loader.dart';
import '../../../../core/util/screen_util.dart';
import '../manger/auth_cubit.dart';
import 'widgets/custom_text_field.dart';

class TabletSignInPage extends StatelessWidget {
  const TabletSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = context.read<AuthCubit>();
        return Scaffold(
          backgroundColor: const Color(0xffF8F9FB),
          body: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Image.asset(AssetsLoader.loginPic),
                  Image.asset(AssetsLoader.loginPicShadow),
                  Positioned(
                    top: ScreenSizeUtil.screenHeight*0.065,
                    child: Center(
                      child: const Column(
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Hi, enter your details to get sign in into your account',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: LoginCard(authCubit: authCubit,context: context,),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.authCubit,
    context
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width * 0.50,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Sign In",
              style: TextStyle(
                  fontSize: ScreenSizeUtil.screenWidth * 0.035,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              isTablet: true,
              controller: authCubit.firstNameController,
              label: 'Enter phone number',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              isTablet: true,
              controller: authCubit.usernameController,
              label: 'Enter password',
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(
                  Icons.remove_red_eye,
                  size: ScreenSizeUtil.screenWidth * 0.025,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  'Forget password?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: ScreenSizeUtil.screenWidth * 0.02,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize:
                      const MaterialStatePropertyAll(Size(double.infinity, 70)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xff0F663C)),
                ),
                onPressed: () {
                  navigateTo(context, HomePage());
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenSizeUtil.screenWidth * 0.02,
                      fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }
}
