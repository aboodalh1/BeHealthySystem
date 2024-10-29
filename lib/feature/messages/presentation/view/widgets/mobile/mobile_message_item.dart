import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';
import 'package:qrreader/feature/messages/presentation/manger/messages_cubit.dart';

class MobileMessageItem extends StatelessWidget {
  const MobileMessageItem({super.key, required this.messagesCubit, required this.index});
  final MessagesCubit messagesCubit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              height: 40.h,
              decoration: BoxDecoration(
                  color: messagesCubit.allMessagesModel.data[index].type=='issue'?kOnWayColor:messagesCubit.allMessagesModel.data[index].type=='register'?kAtStoreColor:kAtCustomerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),)
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    textAlign: TextAlign.center,
                    messagesCubit.allMessagesModel.data[index].type=='issue'?'Issue':
                    messagesCubit.allMessagesModel.data[index].type=='register'?"Registeration":"Different read",style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.w500,fontSize: 12.sp
                  ),),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10),
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),)
            ),
            child: Column(
              children: [
                Text(messagesCubit.allMessagesModel.data[index].message,style: TextStyle(fontSize: 10.sp),),
                Text(messagesCubit.allMessagesModel.data[index].sender??'',style: TextStyle(fontSize: 5.sp),),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(messagesCubit.allMessagesModel.data[index].createdAt),
                  ],
                ),
              ],
            ))
              ],
        ),
      );

  }
}

class MobileUnverifiedItem extends StatefulWidget {
  const MobileUnverifiedItem({
    super.key,
    required this.messagesCubit,
    required this.index,
  });
  final MessagesCubit messagesCubit;
  final int index;
  @override
  State<MobileUnverifiedItem> createState() => _TabletUnverifiedItemState();
}

class _TabletUnverifiedItemState extends State<MobileUnverifiedItem> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessagesCubit, MessagesState>(
      listener: (context, state) {
        if(state is AcceptUserLoading || state is RejectUserLoading){
          setState(() {
            isLoading = true;
          });
        }else if(state is AcceptUserSuccess || state is RejectUserSuccess){
          setState(() {
            isLoading = false;
          });
        }else if(state is AcceptUserFailure || state is RejectUserFailure){
          setState(() {
            isLoading = false;
          });
        }
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 10.h),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 4.w),
              alignment: Alignment.center,
              height: 50.h,
              width: 25.w,
              decoration: BoxDecoration(
                  color: widget.messagesCubit.allUnverifiedModel.data[widget.index].role=='driver'?kSecondaryColor:kUnsubsicriber,
                  borderRadius: BorderRadius.circular(15.r)
              ),
              child: Text(widget.messagesCubit.allUnverifiedModel.data[widget.index].role,style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w500,fontSize: 5.sp
              ),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.messagesCubit.allUnverifiedModel.data[widget.index].name),
                Text(widget.messagesCubit.allUnverifiedModel.data[widget.index].phone),
              ],
            ),
            const Spacer(),
            isLoading? const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              ),
            ): Row(
              children: [
                CustomElevatedButton(title: 'Refuse', onPressed: (){
                  widget.messagesCubit.rejectUser(id: widget.messagesCubit.allUnverifiedModel.data[widget.index].id);
                }, platform: 'desktop', fill: false),
                SizedBox(width: 5.w,),
                CustomElevatedButton(title: 'Approve',
                    platform: 'desktop',
                    onPressed: (){
                      widget.messagesCubit.acceptUser(id: widget.messagesCubit.allUnverifiedModel.data[widget.index].id);
                    }, fill: true),
              ],

            ),
          ],
        ),
      ),
    );
  }
}
