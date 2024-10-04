import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/core/util/app_router.dart';
import 'package:qrreader/core/util/asset_loader.dart';
import 'package:qrreader/core/util/function/navigation.dart';
import 'package:qrreader/feature/Auth/presentation/view/widgets/mobile_widgets/mobile_custom_text_field.dart';
import '../../../../core/util/screen_util.dart';
import '../../../home_page/presentation/view/home_page.dart';
import '../manger/auth_cubit.dart';

class MobileSignInPage extends StatelessWidget {
  const MobileSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = context.read<AuthCubit>();
        return Scaffold(
            backgroundColor: kPrimaryColor,
            body: Column(
              children: [
                Image.asset(AssetsLoader.logo,width: 200.w,height: 200.h,),
                Center(
                  child: MobileLoginCard(authCubit: authCubit),
                ),
              ],
            ));
      },
    );
  }
}

class MobileLoginCard extends StatelessWidget {
  const MobileLoginCard({
    super.key,
    required this.authCubit,
  });

  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Container(
      height: 320.h,
      width: 250.w,
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0.r),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Sign In to your account",
              style: TextStyle(
                color: Colors.black87,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400),
            ),
             SizedBox(
              height: 15.h,
            ),
            MobileCustomTextField(
              isCenter:false,
              isSecure: false,
              controller: authCubit.firstNameController,
              label: 'Enter phone number',
            ),
            SizedBox(
              height: 20.h,
            ),
            MobileCustomTextField
              (isCenter:false,
              isSecure: authCubit.isSecure,
              controller: authCubit.usernameController,
              label: 'Enter password',
              suffixIcon: GestureDetector(
                onTap: (){
                authCubit.changeSecure();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                  child: Icon(authCubit.passwordIcon,size: 18.sp,)
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: (){},
                  child: Text(
                    'Forget password?',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  minimumSize:
                      MaterialStatePropertyAll(Size(100.w, 40.h)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(kPrimaryColor),
                ),
                onPressed: () {Navigator.of(context).pushNamed(AppRoutes.kHomePage);},
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ))
          ],
        ),
      ),
    );
  }
}
