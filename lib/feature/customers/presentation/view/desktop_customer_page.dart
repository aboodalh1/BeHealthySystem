import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/feature/customers/presentation/manger/customer_cubit.dart';
import 'package:qrreader/feature/customers/presentation/view/widgets/customer_grid.dart';
import '../../../../constant.dart';
import '../../../../constant.dart';
import '../../../../core/widgets/custom_snack_bar/custom_snack_bar.dart';
import '../../../home_page/presentation/view/widgets/desktop/custom_search_bar.dart';

class DesktopCustomerPage extends StatelessWidget {
  const DesktopCustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCubit, CustomerState>(
        listener: (context, state) {
      if (state is GetCustomersSuccess) {
        customSnackBar(context, state.message);
      }
      if (state is GetCustomersFailure) {
        customSnackBar(context, state.error, color: kOnWayColor);
      }
      if (state is DeleteCustomerSuccessState) {
        customSnackBar(context, state.message, color: kPrimaryColor);
      }
      if (state is DeleteCustomerSuccessState) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        customSnackBar(context, state.message);
      }
    }, builder: (context, state) {
      if (state is GetCustomersLoading ||
           state is AddCustomersLoading||
          state is DeleteCustomerLoadingState) {
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
      if(state is GetCustomersFailure){
        return Scaffold(body:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Something went wrong",style: TextStyle(fontSize: 5.sp,),),
            SizedBox(height: 50.h,),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kSecondaryColor),
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h))
                ),
                onPressed: (){context.read<CustomerCubit>().getAllCustomers(role: 'all');}, child: const Text("Try again",style: TextStyle(color: Colors.white),))
          ],
        ))
        );}
      CustomerCubit customerCubit = context.read();
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0, right: 25),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Column(
                  children: [
                    SizedBox(height: 30.h,),
                     CustomSearchBar(onChanged: (String val){
                      customerCubit.searchCustomers(search: val);
                                         },),
                    Padding(
                      padding: EdgeInsets.only(right: 38.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10.w,),
                          Text("Filter By Driver: ",style: TextStyle(fontSize: 3.sp,color: Color(0xFF000000)),),
                          SizedBox(width: 40.w,),
                          SizedBox(
                            width: 112.w,
                            child: DropdownButtonFormField(
                                isExpanded: true,
                                value: null,
                                iconSize: 5.sp,
                                isDense: true,
                                hint: Text('${customerCubit.newDriver}',style: TextStyle(fontSize: 3.sp,color: Color(0xFF000000)),),
                                items: drivers.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(), onChanged: (val){
                              customerCubit.newDriver= val!;
                              customerCubit.newDriver=='all'?customerCubit.getAllCustomers(role: 'all'):customerCubit.getCustomersByDriver(driverID: mapDrivers[customerCubit.newDriver]!);
                              // customerCubit.getAllCustomers(role: 'role')
                            }),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    CustomerGrid(
                      customerCubit: customerCubit,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                        IconButton(iconSize:8.sp,icon:Icon(Icons.refresh,color: kSecondaryColor,),onPressed: (){customerCubit.getAllCustomers(role: 'all');},),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            customerCubit.expandButton();
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.25)),
                              foregroundColor: MaterialStateProperty.all(Colors.white),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 5.w,vertical: 4.h)),
                              backgroundColor: MaterialStateProperty.all(kSecondaryColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  side: BorderSide.none,
                                  borderRadius:!customerCubit.isExpand? BorderRadius.circular(11.r):
                                  BorderRadius.only(topLeft: Radius.circular(11.r),topRight: Radius.circular(11.r)),
                                ),
                              )),
                          child:  Text(
                            'Select',
                            style: TextStyle(
                                fontSize: 4.sp, fontWeight: FontWeight.w300, color: Colors.white),
                          ),
                        ),
                        customerCubit.isExpand
                            ? Container(
                          height: 120.h,
                          width: 24.4.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(11.r),
                                  bottomRight: Radius.circular(11.r)),
                              border: Border.all(color: kPrimaryColor)),
                          child: Column(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    customerCubit.getAllCustomers(
                                        role: 'active');
                                  },
                                  child: Text(
                                    "Active",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 3.sp),
                                  )),
                              const Divider(),
                              TextButton(
                                  onPressed: () {
                                    customerCubit.getAllCustomers(
                                        role: 'inactive');
                                  },
                                  child: Text(
                                    "Inactive",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 3.sp),
                                  )),
                              const Divider(),
                              TextButton(
                                  onPressed: () {
                                    customerCubit.getAllCustomers(
                                        role: 'all');
                                  },
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 3.sp),
                                  )),
                            ],
                          ),
                        )
                            : const SizedBox()
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      );
    });
  }
}
