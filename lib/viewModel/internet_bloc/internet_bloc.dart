import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/viewModel/internet_bloc/internet_event.dart';
import 'package:flutter_weather/viewModel/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    debugPrint('InternetBloc created');
    //internet lost event
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    //for internet gained event
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet ||
          result == ConnectivityResult.vpn) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    debugPrint('Connectivity cancel');
    return super.close();
  }
}
