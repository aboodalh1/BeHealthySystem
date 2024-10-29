import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/feature/messages/presentation/view/unverified/tablet_unverified_page.dart';
import 'package:qrreader/feature/messages/presentation/view/widgets/mobile/mobile_message_item.dart';

import '../../../../constant.dart';
import '../../../../core/util/function/navigation.dart';
import '../../../../core/widgets/custom_snack_bar/custom_snack_bar.dart';
import '../../../Auth/presentation/view/sign_in_page.dart';
import '../manger/messages_cubit.dart';

class MobileMessagesPage extends StatelessWidget {
  const MobileMessagesPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagesCubit, MessagesState>(
      listener: (context, state) {
        if(state is AcceptUserFailure){
          customSnackBar(context, state.error);
        }
        if(state is AcceptUserSuccess){
          customSnackBar(context, state.message);
        }
        if (state is GetMessagesFailure) {
          if (state.error == 'Session Expired') {
            navigateAndFinish(context, const SignInPage());
          }
          customSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is GetMessagesLoading || state is GetUnverifiedLoading) {
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
        MessagesCubit messageCubit = context.read<MessagesCubit>();
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(
                        context,
                        BlocProvider.value(
                          value: messageCubit,
                          child: const TabletUnVerifiedPage(),
                        ));
                  },

                  icon: const Icon(Icons.person_add))
            ],
            title: const Text("Messages List"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => MobileMessageItem(messagesCubit: messageCubit,index:index),
                      itemCount: messageCubit.allMessagesModel.data.length),
                )),
          ),
        );
      },
    );
  }
}
