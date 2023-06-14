import 'package:flutter_weather/model/current_weather_model.dart';
import 'package:flutter_weather/model/daily_weather_model.dart';
import 'package:flutter_weather/model/hourly_weather_model.dart';

abstract class WeatherBaseRepository{
  Future<CurrentWeather> getCurrentWeather({double? latitude, double? longitude, String? city});
  Future<HourlyWeather> getCurrentWeatherHourly({double? latitude, double? longitude, String? city});
  Future<DailyWeather> getDailyWeather({double? latitude, double? longitude, String? city});
}