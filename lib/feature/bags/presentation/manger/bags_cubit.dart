import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bags_state.dart';

class BagsCubit extends Cubit<BagsState> {
  BagsCubit() : super(BagsInitial());
}
