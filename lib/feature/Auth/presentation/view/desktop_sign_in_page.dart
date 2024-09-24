import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/core/util/asset_loader.dart';
import 'package:qrreader/feature/Auth/presentation/view/widgets/login_card.dart';

import '../../../../core/util/screen_util.dart';
import '../manger/auth_cubit.dart';

class DesktopSignInPage extends StatelessWidget {
  const DesktopSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(AssetsLoader.loginPic),
                  Image.asset(AssetsLoader.loginPicShadow),
                  Positioned(
                    top:ScreenSizeUtil.screenHeight*0.065,
                    child: const Column(
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(fontSize: 35, color: Colors.white,fontWeight: FontWeight.w400 ),
                        ),
                        Text(
                          'Hi, enter your details to get sign in into your account',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: LoginCard(authCubit: authCubit),
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
