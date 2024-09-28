import 'package:flutter/material.dart';
import 'package:qrreader/core/util/app_router.dart';
import '../../../../../core/util/screen_util.dart';
import '../../manger/auth_cubit.dart';
import 'custom_text_field.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenSizeUtil.screenHeight * 0.52 ,
      width: ScreenSizeUtil.screenWidth * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
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
                  fontSize: ScreenSizeUtil.screenWidth*0.025, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              isTablet: false,
              controller: authCubit.firstNameController,
              label: 'Enter phone number',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              isTablet:false,
              controller: authCubit.usernameController,
              label: 'Enter password',
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(Icons.remove_red_eye),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Spacer(),
                Text(
                  'Forget password?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 15,
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
                  minimumSize: const MaterialStatePropertyAll(
                      Size(double.infinity, 70)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color(0xff0F663C)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.kHomePage);
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }
}
