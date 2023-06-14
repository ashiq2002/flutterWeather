import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/viewModel/selected_cubit/selected_state.dart';

class SelectedItemCubit extends Cubit<SelectedSate>{
  SelectedItemCubit():super(SelectedSate(index: 0));
  void updateSelectedItemState(){
    emit(SelectedSate(index: state.index));
  }
}