part of 'customer_cubit.dart';

@immutable
sealed class CustomerState {}

final class CustomerInitial extends CustomerState {}

final class ChangeToEditState extends CustomerState{}
