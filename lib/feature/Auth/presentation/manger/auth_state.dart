part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SignInLoadingState extends AuthState{}
final class SignInSuccessState extends AuthState{}
final class SignInFailureState extends AuthState{}
final class SignUpLoadingState extends AuthState{}
final class SignUpSuccessState extends AuthState{}
final class SignUpFailureState extends AuthState{}
final class ChangePasswordSecureState extends AuthState{}