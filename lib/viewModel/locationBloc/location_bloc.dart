
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_event.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_state.dart';
import 'package:geolocator/geolocator.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState>{
  LocationBloc():super(LocationLoadingState()) {
    on<LocationEvent>(_getUserLocationEvent);
  }

  _getUserLocationEvent(LocationEvent event, Emitter<LocationState> emit) async{
    final bool isLocationEnabled;
    LocationPermission locationPermission;
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    //emit LocationDeniedSate if Location Service not enabled
    if(!isLocationEnabled){
      debugPrint("location not enabled");
      emit(LocationDeniedState("Location not enabled"));
    }

    //location permission status
    locationPermission = await Geolocator.checkPermission();

    //emit LocationDeniedSate if location permission not granted
    if(locationPermission == LocationPermission.deniedForever || locationPermission == LocationPermission.denied){
      //if the location permission is denied then request to access user location and emit
      debugPrint("location access not granted");
      locationPermission = await Geolocator.requestPermission();

      emit(LocationDeniedState("Location access denied"));
    }

    //if location access is granted then emit LocationGrantedState
    if(locationPermission == LocationPermission.whileInUse || locationPermission == LocationPermission.always){
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((value) {
        debugPrint("lon : ${value.longitude}");
        debugPrint("lat : ${value.latitude}");
        emit(LocationGrantedState(value.latitude, value.longitude));
      });
    }else{
      debugPrint("location access not granted 2 ");
      return emit(LocationDeniedState("Location access denied"));
    }
  }
}