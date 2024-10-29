part of 'bags_cubit.dart';

@immutable
sealed class BagsState {}

final class BagsInitial extends BagsState {}

final class IncreaseBagsState extends BagsState {}

final class DecreaseBagsState extends BagsState {}

final class EditBagsNumberLoading extends BagsState{}
final class EditBagsNumberSuccess extends BagsState{
  final String message;

  EditBagsNumberSuccess({required this.message});
}
final class EditBagsNumberFailure extends BagsState{
  final String error;


  EditBagsNumberFailure({required this.error});}

final class GetBagsNumberLoading extends BagsState{}
final class GetBagsNumberSuccess extends BagsState{
  final String message;
  GetBagsNumberSuccess({required this.message});
}
final class GetBagsNumberFailure extends BagsState{
  final String error;
  GetBagsNumberFailure({required this.error});

}
