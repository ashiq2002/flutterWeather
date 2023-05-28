import 'package:flutter_weather/model/current_weather_model.dart';
import 'package:flutter_weather/model/daily_weather_model.dart';

abstract class WeatherBaseRepository{
  Future<CurrentWeather> getCurrentWeather({required double latitude, required double longitude});
  Future<DailyWeather> getDailyWeather({required double latitude, required double longitude});
}