import 'package:flutter/material.dart';
import 'package:qrreader/core/util/screen_util.dart';
import 'package:qrreader/core/widgets/desktop_drawer.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_search_bar.dart';

import '../../../../constant.dart';

class DesktopUsersPage extends StatelessWidget {
  const DesktopUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DesktopDrawer(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomElevatedButton(title: 'Add User', onPressed: () {},fill: true,platform: 'desktop',),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomSearchBar(),
                        const SizedBox(width: 20,),
                        CustomElevatedButton(platform: 'desktop',title: 'Filter', onPressed: (){},fill: false,)
                      ],
                    ),
                    const SizedBox(
                      height: 110,
                    ),
                    DataTable(
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9).withOpacity(0.25),
                        borderRadius: BorderRadius.circular(5.3),
                        border: Border.all(color: kPrimaryColor,width: 0.5)
                      ),
                      border: TableBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                        columnSpacing: ScreenSizeUtil.screenWidth*0.11,
                        columns: [
                          const DataColumn(label: Text('User Name',style: TextStyle(color: kPrimaryColor),)),
                          const DataColumn(label: Text('User ID',style: TextStyle(color: kPrimaryColor))),
                          const DataColumn(label: Text('Position',style: TextStyle(color: kPrimaryColor))),
                        ],
                        rows: [

                        ]
                    ),
                    DataTable(
                      border: const TableBorder(
                        horizontalInside: BorderSide(width: 0.54, color: Colors.black),
                      ),
                        columnSpacing: ScreenSizeUtil.screenWidth*0.11,
                        columns: [
                          const DataColumn(label: Text('User Name')),
                          const DataColumn(label: Text('User ID')),
                          const DataColumn(label: Text('Position')),
                        ],
                        rows: [
                          const DataRow(cells: [
                            DataCell(Text('User Name')),
                            DataCell(Text('User ID')),
                            DataCell(Text('Position')),
                          ]),
                          const DataRow(cells: [
                            DataCell(Text('User Name')),
                            DataCell(Text('User ID')),
                            DataCell(Text('Position')),
                          ])
                        ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
