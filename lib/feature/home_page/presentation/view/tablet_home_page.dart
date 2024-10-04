import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/feature/Auth/presentation/view/widgets/tablet_widgets/tablet_custom_drawer.dart';
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
      drawer: const TabletDrawer(),
      body:  TabletHomePageBody(),
    );
  }
}

class TabletHomePageBody extends StatelessWidget {
  const TabletHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 20),
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
                height: 70,
              ),
              DataTable(
                  headingRowColor: MaterialStateProperty.all(kPrimaryColor),
                  headingTextStyle: TextStyle(color: Colors.white),
                  border: const TableBorder(
                    horizontalInside:
                    BorderSide(width: 0.54, color: Colors.black),
                  ),

                  columnSpacing: 24.w,
                  columns: [
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
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: kAtStoreColor,
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: TabletCustomText(title: 'Bag ID', isHeader: false,))),
                      const DataCell(TabletCustomText(title: 'Status', isHeader: false,)),
                      const DataCell(TabletCustomText(title: '2024-06-05', isHeader: false,)),
                    ]),
                    DataRow(cells: [
                      const DataCell(TabletCustomText(title: 'Driver Name', isHeader: false,)),
                      const DataCell(TabletCustomText(title: 'Driver ID', isHeader: false,)),
                      const DataCell(TabletCustomText(title: 'Customer Name', isHeader: false,)),
                      DataCell(Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: kAtStoreColor,
                            borderRadius: BorderRadius.circular(3)
                        ),
                        child: TabletCustomText(title: 'Bag ID', isHeader: false,))),
                      const DataCell(TabletCustomText(title: 'Status', isHeader: false,)),
                      const DataCell(TabletCustomText(title: '2024-06-05', isHeader: false,)),
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
    super.key, required this.title, required this.isHeader,
    
  });
  final String title;
  final bool isHeader;
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.initSize(context);
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w400, color:isHeader? Colors.white:Colors.black,
          fontSize: 5.5.sp
      ),
    );
  }
}
