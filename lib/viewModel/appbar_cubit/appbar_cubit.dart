import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/viewModel/appbar_cubit/appbar_state.dart';

class AppBarCubit extends Cubit<AppBarState>{
  AppBarCubit():super(AppBarState(isSearchClick: false));

  void updateAppbarState() {
    final appbarState = AppBarState(isSearchClick: !state.isSearchClick);
    emit(appbarState);
  }
}