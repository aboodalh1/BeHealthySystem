import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/core/util/app_router.dart';
import '../../../../../core/util/screen_util.dart';
import '../../manger/auth_cubit.dart';
import 'custom_text_field.dart';

class DesktopLoginCard extends StatelessWidget {
  const DesktopLoginCard({
    super.key,
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h ,
      width: 120.w,
      padding: EdgeInsets.symmetric(horizontal: 15.0.w,vertical: 10.h),
      margin: EdgeInsets.only(top: 25.h),
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
            SizedBox(
              height: 15.h,
            ),
            CustomTextField(
              isCenter:false,
              isTablet: false,
              controller: authCubit.firstNameController,
              label: 'Enter phone number', isSecure: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(

              isCenter:false,
              isTablet:false,
              controller: authCubit.usernameController,
              label: 'Enter password',
              suffixIcon: GestureDetector(
                onTap: (){
                  authCubit.changeSecure();
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Icon(authCubit.passwordIcon,size: 6.sp,),
                ),
              ), isSecure: authCubit.isSecure,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  'Forget password?',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 4.sp,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize:  MaterialStatePropertyAll(
                      Size(150.w, 60.h)),
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
