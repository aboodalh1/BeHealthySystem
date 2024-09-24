import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  CustomerCubit() : super(CustomerInitial());
  bool isEdit = false;
  void changeToEditCard(){
    isEdit=!isEdit;
    emit(ChangeToEditState());
  }
}
