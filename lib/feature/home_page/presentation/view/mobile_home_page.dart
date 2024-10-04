import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/core/util/app_router.dart';
import 'package:qrreader/feature/home_page/presentation/manger/home_cubit.dart';
import 'package:qrreader/feature/home_page/presentation/view/desktop_home_page.dart';
import 'package:qrreader/feature/home_page/presentation/view/tablet_home_page.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = context.read<HomeCubit>();
        return Scaffold(
          appBar: AppBar(backgroundColor: kPrimaryColor,),
          drawer: CustomMobileDrawer(homeCubit: homeCubit),
          body:  MobileHomeBody(homeCubit:homeCubit),
        );
      },
    );
  }
}

class MobileHomeBody extends StatelessWidget{
  const MobileHomeBody({super.key,required this.homeCubit});
  final HomeCubit homeCubit;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
              const MobileCustomSearchBar(),
                  SizedBox(width: 20.w,),
                  CustomElevatedButton(
                    fill: true,
                    title: 'Generate QR',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 80.h,
              ),

              MobileHomeTable(homeCubit: homeCubit)
            ],
          ),
        ),
      ),
    );
  }
}

class MobileHomeTable extends StatelessWidget {
   MobileHomeTable({
    super.key,
    required this.homeCubit,
  });
  final TransformationController transformationController =
  TransformationController();
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      transformationController: transformationController,
      minScale: 0.5,
      maxScale: 2.5,
      child: DataTable(
        horizontalMargin: 5.w,
        headingRowHeight: 20.h,
          headingRowColor: MaterialStateProperty.all(kPrimaryColor),
          headingTextStyle: const TextStyle(color: Colors.white),
          border: const TableBorder(
            horizontalInside:
            BorderSide(width: 0.54, color: Colors.black),
          ),
          columnSpacing: 10.w,
          columns: const [
            DataColumn(
                label: TabletCustomText(title: 'Driver Name', isHeader: true,)),
            DataColumn(
                label: TabletCustomText(title: 'Driver ID', isHeader: true,)),
            DataColumn(
                label: TabletCustomText(title: 'Customer Name', isHeader: true,)),
            DataColumn(
                label: TabletCustomText(title: 'Bag ID', isHeader: true,)),
            DataColumn(
                label: TabletCustomText(title: 'Status', isHeader: true,)),
            DataColumn(
                label: TabletCustomText(title: 'Date', isHeader: true,)),
          ],
          rows:  [
            DataRow(cells: [
              const DataCell(TabletCustomText(title: 'Driver Name', isHeader: false,)),
              const DataCell(TabletCustomText(title: 'Driver ID', isHeader: false,)),
              const DataCell(TabletCustomText(title: 'Customer Name', isHeader: false,)),
              DataCell(Container(
                  padding: EdgeInsets.all(2.sp),
                  decoration: BoxDecoration(
                      color: kAtStoreColor,
                      borderRadius: BorderRadius.circular(3.r)
                  ),
                  child: const TabletCustomText(title: 'Bag ID', isHeader: false,))),
              const DataCell(TabletCustomText(title: 'Status', isHeader: false,)),
              const DataCell(TabletCustomText(title: '2024-06-05', isHeader: false,)),
            ]),
            DataRow(cells: [
              const DataCell(TabletCustomText(title: 'Driver Name', isHeader: false,)),
              const DataCell(TabletCustomText(title: 'Driver ID', isHeader: false,)),
              const DataCell(TabletCustomText(title: 'Customer Name', isHeader: false,)),
              DataCell(Container(
                  padding:  EdgeInsets.all(3.sp),
                  decoration: BoxDecoration(
                      color: kAtStoreColor,
                      borderRadius: BorderRadius.circular(3)
                  ),
                  child: const TabletCustomText(title: 'Bag ID', isHeader: false,))),
              const DataCell(TabletCustomText(title: 'Status', isHeader: false,)),
              const DataCell(TabletCustomText(title: '2024-06-05', isHeader: false,)),
            ])
          ]),
    );
  }
}

class CustomMobileDrawer extends StatelessWidget {
  const CustomMobileDrawer({
    super.key,
    this.homeCubit,
  });

  final HomeCubit? homeCubit;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220.w,
      backgroundColor: kPrimaryColor,
      child: Container(
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0.sp),
              child: Text('Be Healthy',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w300)),
            ),
             SizedBox(
              height: 40.sp,
            ),
            CustomTextButton(
              function: () {
                Navigator.of(context).pushNamed(AppRoutes.kHomePage);
                // homeCubit!.currentIndex=0;
              },
              icon: Icons.home_filled,
              title: 'Home',
            ),
            CustomTextButton(
              function: () {
                Navigator.of(context).pushNamed(AppRoutes.kCustomerPage);
                // homeCubit!.currentIndex=1;
              },
              icon: Icons.person,
              title: 'Customers',
            ),
            CustomTextButton(
              function: () {
                Navigator.of(context).pushNamed(AppRoutes.kReportsPage);
                // homeCubit!.currentIndex=2;
              },
              icon: Icons.report,
              title: 'Reports',
            ),
            CustomTextButton(
              function: () {
                Navigator.of(context).pushNamed(AppRoutes.kBagsPage);
                // homeCubit!.currentIndex=3;
              },
              icon: Icons.shopping_bag_rounded,
              title: 'Bags',
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: const Divider(
                height: 0.2,
              ),
            ),
            CustomTextButton(
              function: () {
                Navigator.of(context).pushNamed(AppRoutes.kSignInPage);
              },
              title: "Sign out",
              icon: Icons.login,
            )
          ],
        ),
      ),
    );
  }
}



class MobileCustomSearchBar extends StatelessWidget {
  const MobileCustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 130.w,
      child: TextFormField(
        cursorErrorColor: kPrimaryColor,
        cursorColor: kPrimaryColor,
          decoration:  InputDecoration(
            contentPadding: EdgeInsets.all(10.sp),
              focusColor: kPrimaryColor,
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Icon(
                  Icons.search,
                  size: 15.sp,
                  color: Colors.black,
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  )))),
    );
  }
}

