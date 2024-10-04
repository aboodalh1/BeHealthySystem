import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';
import 'package:qrreader/feature/Auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepo authRepo;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> login()async{
    emit(SignInLoadingState());

  }
  bool isSecure = true;
  IconData passwordIcon =Icons.remove_red_eye_outlined;
  void changeSecure(){
    isSecure = !isSecure;
    passwordIcon = isSecure?  Icons.remove_red_eye:Icons.remove_red_eye_outlined;
    emit(ChangePasswordSecureState());
  }

}