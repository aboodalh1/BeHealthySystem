import 'package:dartz/dartz.dart';
import 'package:dio/src/response.dart';
import 'package:qrreader/core/failure/failure.dart';
import 'package:qrreader/core/util/api_service.dart';
import 'package:qrreader/feature/Auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  DioHelper dioHelper;
  AuthRepoImpl(this.dioHelper);
  @override
  Future<Either<Failure, Response>> forgetPassword() {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Response>> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }

}