import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/feature/home_page/presentation/manger/home_cubit.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_search_bar.dart';

import '../../../../core/widgets/desktop_drawer.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({required BuildContext context, super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DesktopDrawer(),
          BlocProvider(
            create: (context) => HomeCubit(),
            child: DesktopHomePageBody(),
          ),
        ],
      ),
    );
  }
}

class DesktopHomePageBody extends StatelessWidget {
  const DesktopHomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CustomSearchBar(),
                  SizedBox(width: ScreenSizeUtil.screenWidth*0.18,),
                  CustomElevatedButton(
                    fill: true,
                    title: 'Generate QR',
                    onPressed: () {
                      Navigator.of(context).pushNamed('generate_qr');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: ScreenSizeUtil.screenHeight * 0.05,
              ),

              const SizedBox(
                height: 20,
              ),
              DataTable(
                headingRowColor: MaterialStateProperty.all(kPrimaryColor),
                  headingTextStyle: TextStyle(color: Colors.white),
                  border: const TableBorder(
                    horizontalInside:
                        BorderSide(width: 0.54, color: Colors.black),
                  ),

                  columnSpacing: ScreenSizeUtil.screenWidth * 0.04,
                  columns: const [
                    DataColumn(
                        label: Text(
                      'Driver Name',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    )),
                    DataColumn(
                        label: Text('Driver ID',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                    DataColumn(
                        label: Text('Customer Name',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                    DataColumn(
                        label: Text('Bag ID',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                    DataColumn(
                        label: Text('Status',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                    DataColumn(
                        label: Text('Date',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                  ],
                  rows:  [
                    DataRow(cells: [
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'User Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'User ID',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'Position',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'Position',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'Position',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'Position',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'User Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'User ID',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'Position',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                      DataCell(Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: kAtStoreColor,
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: Text(
                            textAlign: TextAlign.center,
                            'At Store',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                      )),
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'Position',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                      DataCell(Text(
                          textAlign: TextAlign.center,
                          'Position',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black))),
                    ])
                  ])
            ],
          ),
        ),
      ),
    );
  }

  Text customText({required String label, color}) => Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color == Colors.black ? Colors.black : kPrimaryColor,
            fontSize: ScreenSizeUtil.screenWidth < 1000 ? 16 : 14,
            fontWeight: FontWeight.w400),
      );
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback function;

  const CustomTextButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: TextButton(
          onPressed: function,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              )
            ],
          )),
    );
  }
}
