import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';

part 'bags_state.dart';

class BagsCubit extends Cubit<BagsState> {
  BagsCubit() : super(BagsInitial());

  final TextEditingController bagsController = TextEditingController(text: '1');

  void increaseBagsCounter(){
      bagsController.text=(int.parse(bagsController.text)+1).toStringAsExponential();
      emit(IncreaseBagsState());
  }
  void decreaseBagsCounter(){
      bagsController.text=(int.parse(bagsController.text)-1).toStringAsExponential();
      emit(DecreaseBagsState());
  }
}
