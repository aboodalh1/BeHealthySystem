part of 'generate_qr_cubit.dart';

@immutable
sealed class GenerateQrState {}

final class GenerateQrcubitInitial extends GenerateQrState {}

final class GenerateNewQrState extends GenerateQrState{}
final class ClearQrState extends GenerateQrState{}
