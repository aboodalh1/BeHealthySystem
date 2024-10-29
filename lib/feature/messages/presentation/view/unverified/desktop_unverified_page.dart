import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../constant.dart';
import '../../../../../core/util/function/navigation.dart';
import '../../../../../core/widgets/custom_snack_bar/custom_snack_bar.dart';
import '../../../../Auth/presentation/view/sign_in_page.dart';
import '../../manger/messages_cubit.dart';
import '../widgets/desktop/desktop_message_item.dart';

class DesktopUnVerifiedPage extends StatelessWidget {
  const DesktopUnVerifiedPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesCubit, MessagesState>(
      listener: (context, state) {
        if (state is AcceptUserFailure) {
          customSnackBar(context, state.error);
        }
        if (state is AcceptUserSuccess) {
          customSnackBar(context, state.message);
        }
        if (state is RejectUserFailure) {
          customSnackBar(context, state.error);
        }
        if (state is RejectUserSuccess) {
          customSnackBar(context, state.message);
        }
        if (state is GetUnverifiedFailure) {
          if (state.error == 'Session Expired') {
            navigateAndFinish(context, const SignInPage());
          }
          else {
            customSnackBar(context, state.error);
          }
        }
      },
      builder: (context, state) {
        if (state is GetUnverifiedLoading) {
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
        if (state is GetUnverifiedFailure) {
          return Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Text(state.error),
                  ],
                ),
              )
          );
        }
        MessagesCubit messageCubit = context.read<MessagesCubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Unverified Messages"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(onPressed: (){messageCubit.getAllUnverified();}, icon: Icon(Icons.refresh))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          BlocProvider.value(
                            value: messageCubit,
                            child: DesktopUnverifiedItem(
                                messagesCubit: messageCubit, index: index),
                          ),
                      separatorBuilder: (context, index) =>
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            child: const Divider(color: kSecondaryColor),
                          ),
                      itemCount: messageCubit.allUnverifiedModel.data.length),
                )),
          ),
        );
      },
    );
  }
}
