import 'package:flutter/material.dart';
import 'package:qrreader/feature/Auth/presentation/view/widgets/tablet_widgets/tablet_custom_drawer.dart';
import '../../../../constant.dart';
import '../../../../core/util/screen_util.dart';
import '../../../home_page/presentation/view/widgets/custom_elevated_button.dart';
class TabletUsersPage extends StatelessWidget {
  const TabletUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor),
      drawer: TabletDrawer(),
      body: SingleChildScrollView(
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
                  Container(width:ScreenSizeUtil.screenWidth*0.3,height:ScreenSizeUtil.screenWidth/20,child: SearchBar(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(0),
                    leading: Icon(Icons.search),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    side: MaterialStateProperty.all(BorderSide(color: Colors.black,width: 0.7)),
                  )),
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
    );
  }
}
