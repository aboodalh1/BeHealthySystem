import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/failure/failure.dart';

abstract class AuthRepo{
  Future<Either<Failure,Response>> login();
  Future<Either<Failure,Response>> signup();
  Future<Either<Failure,Response>> forgetPassword();
  Future<Either<Failure,Response>> logout();
}