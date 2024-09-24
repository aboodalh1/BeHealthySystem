import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qrreader/core/util/api_service.dart';
import 'package:qrreader/core/util/screen_util.dart';

import '../../feature/Auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton(ScreenSizeUtil());
  getIt.registerSingleton(DioHelper(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt.get<DioHelper>()));


}