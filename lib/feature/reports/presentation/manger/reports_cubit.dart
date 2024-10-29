import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:qrreader/feature/reports/data/model/all_reports_model.dart';

import '../../data/repos/reports_repo.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit(this.reportsRepo) : super(ReportsInitial());
  ReportsRepo reportsRepo;
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController(text:DateFormat('yyyy-MM-dd').format(DateTime.now()));

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      getAllReports();
    }
  }
  AllReportsModel allReportsModel = AllReportsModel(data: Data(cards: Cards(storedStage_1: 1, storedStage_2: 1, shipping: 1, delivered: 1),
      table: []),message: '',code: 1);
  Future<void>getAllReports()async{
    desktopRows = [];
      emit(GetReportsLoadingState());
      var result = await reportsRepo.getReports(date: dateController.text);
      result.fold((failure) {
        emit(GetReportsFailureState(error: failure.errMessage));
      },
              (response) {
            allReportsModel = AllReportsModel.fromJson(response.data);
            emit(GetReportsSuccessState(message: allReportsModel.message));
              });
  }

  List<DataRow> desktopRows = [];
  List<DataRow> tabletRows = [];
  List<DataRow> mobileRow = [];
}
