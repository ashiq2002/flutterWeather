import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/repository/weather_base_repository.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_event.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherBaseRepository _weatherRepository;

  WeatherBloc({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(WeatherLoadingState()){
    on<WeatherLoadedEvent>(_weatherEvent);
  }

  //current weather event
  void _weatherEvent(
      WeatherLoadedEvent event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoadingState());
      //fetch weather data
      final currentWeather = await _weatherRepository.getCurrentWeather(
          latitude: event.latitude,
          longitude: event.longitude,
          city: event.city);

      final hourlyWeather = await _weatherRepository.getCurrentWeatherHourly(
          latitude: event.latitude,
          longitude: event.longitude,
          city: event.city);

      final dailyWeather = await _weatherRepository.getDailyWeather(
          latitude: event.latitude,
          longitude: event.longitude,
          city: event.city);

      debugPrint("CurrentWeather data : ${currentWeather.toJson()}");
      debugPrint("DailyWeather data : ${dailyWeather.toJson()}");
      debugPrint("HourlyWeather data : ${hourlyWeather.toJson()}");

      emit(WeatherLoadedState(
        currentWeather: currentWeather,
        dailyWeather: dailyWeather,
        hourlyWeather: hourlyWeather
      ));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
      debugPrint("Weather error : ${e.toString()}");
    }
  }
}
