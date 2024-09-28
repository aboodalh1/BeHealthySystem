import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qrreader/feature/home_page/presentation/view/home_page.dart';
import 'package:qrreader/feature/reports/presentation/view/reports_page.dart';
import 'package:qrreader/feature/users/presentation/view/users_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    ReportsPage(),
    UsersPage(),
  ];
}
