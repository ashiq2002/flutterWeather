import 'package:flutter_weather/model/current_weather_model.dart';
import 'package:flutter_weather/model/daily_weather_model.dart';

abstract class WeatherState{}

//weather loading state
class WeatherLoadingState extends WeatherState{}

//current weather loaded state
class CurrentWeatherLoadedState extends WeatherState{
  final CurrentWeather currentWeather;

  CurrentWeatherLoadedState({required this.currentWeather});
}

//daily weather loaded state
class DailyWeatherLoadedState extends WeatherState{
  final DailyWeather dailyWeather;

  DailyWeatherLoadedState({required this.dailyWeather});
}

//weather error state
class WeatherErrorState extends WeatherState{
  final String error;

  WeatherErrorState(this.error);
}