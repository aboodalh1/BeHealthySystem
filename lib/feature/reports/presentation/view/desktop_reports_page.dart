import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qrreader/constant.dart';
import 'package:qrreader/core/util/asset_loader.dart';
import 'package:qrreader/feature/home_page/presentation/view/widgets/custom_elevated_button.dart';
import 'package:qrreader/feature/reports/presentation/manger/reports_cubit.dart';
import 'package:qrreader/feature/reports/presentation/view/widgets/desktop/desktop_bag_status_card.dart';
import '../../../../core/widgets/desktop/desktop_custom_tablet_text.dart';
import '../../../../core/widgets/desktop_status_cell.dart';

class DesktopReportsPage extends StatelessWidget {
  const DesktopReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReportsCubit, ReportsState>(
      listener: (context, state) {
        if (state is GetReportsSuccessState) {
          context.read<ReportsCubit>().desktopRows = [];
          for (int i = 0;
              i <
                  context
                      .read<ReportsCubit>()
                      .allReportsModel
                      .data
                      .table
                      .length;
              i++) {
            for (int j = 0;
                j <
                    context
                        .read<ReportsCubit>()
                        .allReportsModel
                        .data
                        .table[i]
                        .data
                        .length;
                j++) {
              context.read<ReportsCubit>().desktopRows.add(DataRow(cells: [
                    DataCell(DesktopCustomRowText(
                      title: context
                          .read<ReportsCubit>()
                          .allReportsModel
                          .data
                          .table[i]
                          .data[j]
                          .driverName,
                    )),  DataCell(DesktopCustomRowText(
                      title: context
                          .read<ReportsCubit>()
                          .allReportsModel
                          .data
                          .table[i]
                          .customerName,
                    )),
                    DataCell(
                      DesktopStatusCell(
                        title: context
                                        .read<ReportsCubit>()
                                        .allReportsModel
                                        .data
                                        .table[i]
                                        .data[j]
                                        .bagState ==
                                    'stored_stage_1' ||
                                context
                                        .read<ReportsCubit>()
                                        .allReportsModel
                                        .data
                                        .table[i]
                                        .data[j]
                                        .bagState ==
                                    'stored_stage_2'
                            ? 'At Store'
                            : context
                                        .read<ReportsCubit>()
                                        .allReportsModel
                                        .data
                                        .table[i]
                                        .data[j]
                                        .bagState ==
                                    'shipping'
                                ? 'On Way'
                                : 'Delivered',
                        color: context
                                        .read<ReportsCubit>()
                                        .allReportsModel
                                        .data
                                        .table[i]
                                        .data[j]
                                        .bagState ==
                                    'stored_stage_1' ||
                                context
                                        .read<ReportsCubit>()
                                        .allReportsModel
                                        .data
                                        .table[i]
                                        .data[j]
                                        .bagState ==
                                    'stored_stage_2'
                            ? kAtStoreColor
                            : context
                                        .read<ReportsCubit>()
                                        .allReportsModel
                                        .data
                                        .table[i]
                                        .data[j]
                                        .bagState ==
                                    'shipping'
                                ? kOnWayColor
                                : kAtCustomerColor,
                      ),
                    ),
                    DataCell(DesktopCustomRowText(
                      title: context
                          .read<ReportsCubit>()
                          .allReportsModel
                          .data
                          .table[i]
                          .data[j]
                          .date,
                    ))
                  ]));
            }
          }
        }
      },
      builder: (context, state) {
        if(state is GetReportsFailureState){
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
                 onPressed: (){context.read<ReportsCubit>().getAllReports();}, child: Text("Try again",style: TextStyle(color: Colors.white),))
           ],
         ))
         );}
        ReportsCubit reportsCubit = context.read<ReportsCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 60.w,
                    child: TextFormField(
                      readOnly: true,
                      controller: reportsCubit.dateController,
                      cursorColor: kPrimaryColor,
                      style: const TextStyle(color: Colors.black),
                      onTap: () => reportsCubit.selectDate(context),
                      decoration: const InputDecoration(
                          hintText: 'Select Date',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor)),
                          suffixIcon: Icon(
                            Icons.calendar_month_outlined,
                            color: kPrimaryColor,
                          )),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  DesktopBagsStatusCard(
                    title: 'At Store',
                    image: AssetsLoader.bags,
                    bagsNumber: state is GetReportsLoadingState
                        ? 'Loading...'
                        : '${reportsCubit.allReportsModel.data.cards.storedStage_1 + reportsCubit.allReportsModel.data.cards.storedStage_2}',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  DesktopBagsStatusCard(
                    title: 'At Customer',
                    image: AssetsLoader.customerEmp,
                    bagsNumber: state is GetReportsLoadingState
                        ? 'Loading...'
                        : '${reportsCubit.allReportsModel.data.cards.delivered}',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  DesktopBagsStatusCard(
                    title: 'Delivered',
                    bagsNumber: state is GetReportsLoadingState
                        ? 'Loading...'
                        : '${reportsCubit.allReportsModel.data.cards.shipping}',
                    image: AssetsLoader.driver,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: const Offset(0, 2.8),
                        blurRadius: 4.81.r,
                      )
                    ],
                  ),
                  width: 245.w,
                  height: 40,
                  child: CustomElevatedButton(
                    title: "Reports",
                    onPressed: () async {
                      // final pdf = pw.Document();
                      // final reportsCubit = context.read<ReportsCubit>();
                      // pdf.addPage(
                      //   pw.Page(
                      //     build: (pw.Context context) {
                      //       return pw.Column(
                      //         children: [
                      //           pw.Text('Reports', style: const pw.TextStyle(fontSize: 24)),
                      //           pw.SizedBox(height: 20),
                      //           pw.Table.fromTextArray(
                      //             border: pw.TableBorder.all(),
                      //             headers: ['Driver Name', 'Status', 'Date'],
                      //             data: reportsCubit.rows.map((row) {
                      //               return [
                      //                 row.cells[0].child.toString(), // Driver Name
                      //                 row.cells[1].child.key, // Status
                      //                 row.cells[2].child.key, // Date
                      //               ];
                      //             }).toList(),
                      //           )
                      //         ],
                      //       );
                      //     },
                      //   ),
                      // );
                      //
                      // // Save or print the PDF
                      // await Printing.layoutPdf(
                      //   onLayout: (PdfPageFormat format) async => pdf.save(),
                      // );
                    },
                    fill: false,
                    platform: 'desktop',
                  )),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 250.w,
                height: 0.34,
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              state is GetReportsLoadingState
                  ? SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: Center(
                        child: Column(
                          children: [
                            const CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Getting reports...",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 5.sp),
                            )
                          ],
                        ),
                      ),
                    )
                  : reportsCubit.desktopRows.isEmpty
                      ? Center(
                          child: Text(
                          'You didn\'t have any scanning process this day',
                          style: TextStyle(fontSize: 5.sp),
                        ))
                      : DataTable(
                          border: const TableBorder(
                            horizontalInside:
                                BorderSide(width: 0.54, color: Colors.black),
                          ),
                          dataRowHeight: 30,
                          headingRowHeight: 30,
                          columnSpacing: 20.w,
                          headingRowColor:
                              MaterialStateProperty.all(kPrimaryColor),
                          columns: const [
                            DataColumn(
                                label: DesktopCustomColumnText(
                              title: 'Driver Name',
                            )),
                            DataColumn(
                                label: DesktopCustomColumnText(
                              title: 'Customer Name',
                            )),
                            DataColumn(
                                label: DesktopCustomColumnText(
                              title: "Status",
                            )),
                            DataColumn(
                                label: DesktopCustomColumnText(
                              title: "Date",
                            )),
                          ],
                          rows: reportsCubit.desktopRows)
            ],
          ),
        );
      },
    );
  }
}
