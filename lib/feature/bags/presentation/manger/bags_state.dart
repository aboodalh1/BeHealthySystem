part of 'bags_cubit.dart';

@immutable
sealed class BagsState {}

final class BagsInitial extends BagsState {}

final class IncreaseBagsState extends BagsState {}

final class DecreaseBagsState extends BagsState {}
