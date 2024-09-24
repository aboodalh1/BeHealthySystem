import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/core/util/function/navigation.dart';
import '../../../../core/util/screen_util.dart';
import '../../../home_page/presentation/view/home_page.dart';
import '../manger/auth_cubit.dart';
import 'widgets/custom_text_field.dart';

class MobileSignInPage extends StatelessWidget {
  const MobileSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = context.read<AuthCubit>();
        return Scaffold(
            backgroundColor: const Color(0xffF8F9FB),
            body: Center(
              child: LoginCard(authCubit: authCubit),
            ));
      },
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSizeUtil.screenHeight * 0.55,
      width: ScreenSizeUtil.screenWidth * 0.50,
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
                onPressed: () {navigateTo(context, HomePage());},
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
