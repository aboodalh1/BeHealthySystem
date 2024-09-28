import 'package:flutter/material.dart';
import '../../../../constant.dart';
import '../../../../core/util/screen_util.dart';
import '../../../home_page/presentation/view/widgets/custom_elevated_button.dart';
import '../../../home_page/presentation/view/widgets/custom_search_bar.dart';
class TabletUsersPage extends StatelessWidget {
  const TabletUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomElevatedButton(
                  title: 'Add User',
                  onPressed: () {},
                  fill: true,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomSearchBar(),
                const SizedBox(
                  width: 20,
                ),
                CustomElevatedButton(
                  title: 'Filter',
                  onPressed: () {},
                  fill: false,
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            DataTable(
                decoration: BoxDecoration(
                    color: Color(0xffD9D9D9).withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5.3),
                    border: Border.all(color: kPrimaryColor, width: 0.5)),
                border: TableBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                columnSpacing: ScreenSizeUtil.screenWidth * 0.18,
                columns: [
                  DataColumn(
                      label: SizedBox(
                        width: ScreenSizeUtil.screenWidth*0.16,
                        child: Text(
                                            'User Name',
                                            style: TextStyle(color: kPrimaryColor),
                                          ),
                      )),
                   DataColumn(
                      label: SizedBox(
                        width: ScreenSizeUtil.screenWidth*0.16,
                        child: Text('User ID',
                            style: TextStyle(color: kPrimaryColor)),
                      )),
                  DataColumn(
                      label: SizedBox(
                        width: ScreenSizeUtil.screenWidth*0.16,
                        child: Text('Position',
                            style: TextStyle(color: kPrimaryColor)),
                      )),
                ],
                rows: []),
            Container(
              child: DataTable(
                  border: const TableBorder(
                    horizontalInside:
                        BorderSide(width: 0.54, color: Colors.black),
                  ),
                  columnSpacing: ScreenSizeUtil.screenWidth * 0.18,
                  columns: [
                    const DataColumn(label: Text('User Name')),
                    const DataColumn(label: Text('User ID')),
                    const DataColumn(label: Text('Position')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(SizedBox(
                        width: ScreenSizeUtil.screenWidth*0.16,
                        child: Expanded(
                            child: Text(
                          'User Namefsdfsdfsdfsdfsdfsd',
                          softWrap: true,
                        )),
                      )),
                      DataCell(SizedBox(
                        width: ScreenSizeUtil.screenWidth*0.16,
                        child: Expanded(
                            child: Text(
                              'User Namefsdfsdfsdfsdfsdfsd',
                              softWrap: true,
                            )),
                      )),
                      DataCell(SizedBox(
                        width: ScreenSizeUtil.screenWidth*0.16,
                        child: Expanded(
                            child: Text(
                              'User Namefsdfsdfsdfsdfsdfsd',
                              softWrap: true,
                            )),
                      )),
                    ]),
                     DataRow(cells: [
                      DataCell(SizedBox(
                        width: ScreenSizeUtil.screenWidth*0.16,
                        child: Expanded(
                            child: Text(
                              'User Namefsdfsdfsdfsdfsdfsd',
                              softWrap: true,
                            )),
                      )),
                      DataCell(SizedBox(
                        width: ScreenSizeUtil.screenWidth*0.16,
                        child: Expanded(
                            child: Text(
                              'User Namefsdfsdfsdfsdfsdfsd',
                              softWrap: true,
                            )),
                      )),
                      DataCell(SizedBox(
                        width: ScreenSizeUtil.screenWidth*0.16,
                        child: Expanded(
                            child: Text(
                              'User Namefsdfsdfsdfsdfsdfsd',
                              softWrap: true,
                            )),
                      )),
                    ])
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
