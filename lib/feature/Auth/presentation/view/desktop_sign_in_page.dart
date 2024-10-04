import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/core/util/asset_loader.dart';
import 'package:qrreader/feature/Auth/presentation/view/widgets/desktop_login_card.dart';
import 'package:qrreader/feature/Auth/presentation/view/widgets/title_on_image.dart';
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
                  Image.asset(AssetsLoader.loginPic,scale: 0.833,),
                  Image.asset(AssetsLoader.loginPicShadow,scale: 0.833,),
                  TitleOnImage(),
                  Center(
                    child: DesktopLoginCard(authCubit: authCubit),
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
