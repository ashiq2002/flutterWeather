import 'package:equatable/equatable.dart';
import 'package:flutter_weather/model/current_weather_model.dart';
import 'package:flutter_weather/model/daily_weather_model.dart';
import 'package:flutter_weather/model/hourly_weather_model.dart';

abstract class WeatherState extends Equatable{
  const WeatherState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//weather loading state
class WeatherLoadingState extends WeatherState {}

//current weather loaded state
class WeatherLoadedState extends WeatherState {
  final CurrentWeather currentWeather;
  final DailyWeather dailyWeather;
  final HourlyWeather hourlyWeather;

  const WeatherLoadedState({required this.currentWeather, required this.dailyWeather, required this.hourlyWeather});

  @override
  // TODO: implement props
  List<Object?> get props => [currentWeather, dailyWeather, hourlyWeather];
}

//weather error state
class WeatherErrorState extends WeatherState {
  final String error;

  const WeatherErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
