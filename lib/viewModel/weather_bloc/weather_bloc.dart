import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/repository/weather_base_repository.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_event.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherBaseRepository _weatherRepository;
  final double latitude, longitude;

  WeatherBloc(
      {required WeatherRepository weatherRepository,
      required this.latitude,
      required this.longitude})
      : _weatherRepository = weatherRepository,
        super(WeatherLoadingState()) {
    //register CurrentWeatherLoadedEvent
    on<CurrentWeatherLoadedEvent>(_currentWeatherEvent);

    //register CDailyWeatherLoadedEvent
    on<DailyWeatherLoadedEvent>(_dailyWeatherEvent);
  }

  //current weather event
  void _currentWeatherEvent(CurrentWeatherLoadedEvent event, Emitter<WeatherState> emit) async{
    try {
      //fetch current weather data
      final currentWeather = await _weatherRepository.getCurrentWeather(latitude: latitude, longitude: longitude);

      emit(CurrentWeatherLoadedState(currentWeather: currentWeather));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }

  void _dailyWeatherEvent(DailyWeatherLoadedEvent event, Emitter<WeatherState> emit) async{
    try{
      //fetch daily weather data
      final dailyWeather = await _weatherRepository.getDailyWeather(latitude: latitude, longitude: longitude);
      for(var d in dailyWeather.data!){
        debugPrint("DailyWeather: ${d.datetime}");
      }
      emit(DailyWeatherLoadedState(dailyWeather: dailyWeather));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
