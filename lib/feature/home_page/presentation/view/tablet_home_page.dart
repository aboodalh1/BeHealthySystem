import 'package:flutter/material.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_search_bar.dart';
import '../../../../constant.dart';
import '../../../../core/util/screen_util.dart';
import '../../../../core/widgets/desktop_drawer.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({required BuildContext context, super.key});
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor,),
      drawer: const DesktopDrawer(),
      body:  TabletHomePageBody(),
    );
  }
}

class TabletHomePageBody extends StatelessWidget {
  const TabletHomePageBody({super.key});

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
                  CustomElevatedButton(
                    fill: true,
                    title: 'Generate QR',
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const CustomSearchBar(),
              const SizedBox(
                height: 110,
              ),
              DataTable(
                  border: const TableBorder(
                    horizontalInside:
                    BorderSide(width: 0.54, color: Colors.black),
                  ),
                  columnSpacing: ScreenSizeUtil.screenWidth * 0.03,
                  columns: [
                    DataColumn(
                        label: TabletCustomText(title: 'Driver Name',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Driver ID',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Customer Name',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Bag ID',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Status',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Date',)),
                  ],
                  rows:  []),
              DataTable(
                  border: const TableBorder(
                    horizontalInside:
                    BorderSide(width: 0.54, color: Colors.black),
                  ),
                  columnSpacing: ScreenSizeUtil.screenWidth * 0.03,
                  columns: [
                    DataColumn(
                        label: TabletCustomText(title: 'Driver Name',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Driver ID',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Customer Name',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Bag ID',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Status',)),
                    DataColumn(
                        label: TabletCustomText(title: 'Date',)),
                  ],
                  rows:  [
                    DataRow(cells: [
                      const DataCell(TabletCustomText(title: 'Driver Name')),
                      const DataCell(TabletCustomText(title: 'Driver ID')),
                      const DataCell(TabletCustomText(title: 'Customer Name')),
                      DataCell(Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: kAtStoreColor,
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: TabletCustomText(title: 'Bag ID'))),
                      const DataCell(TabletCustomText(title: 'Status')),
                      const DataCell(TabletCustomText(title: '2024-06-05')),
                    ]),
                    DataRow(cells: [
                      const DataCell(TabletCustomText(title: 'Driver Name')),
                      const DataCell(TabletCustomText(title: 'Driver ID')),
                      const DataCell(TabletCustomText(title: 'Customer Name')),
                      DataCell(Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: kAtStoreColor,
                            borderRadius: BorderRadius.circular(3)
                        ),
                        child: TabletCustomText(title: 'Bag ID'))),
                      const DataCell(TabletCustomText(title: 'Status')),
                      const DataCell(TabletCustomText(title: '2024-06-05')),
                    ])
                  ])
            ],
          ),
        ),
      ),
    );
  }
}

class TabletCustomText extends StatelessWidget {
  const TabletCustomText({
    super.key, required this.title,
    
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w400, color: Colors.black,
          fontSize: ScreenSizeUtil.screenWidth*0.017
      ),
    );
  }
}
