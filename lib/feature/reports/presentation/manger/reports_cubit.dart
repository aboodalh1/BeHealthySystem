import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportsInitial());
}
