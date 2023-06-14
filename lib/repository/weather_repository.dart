import 'package:flutter/cupertino.dart';
import 'package:flutter_weather/data/network/api_dao.dart';
import 'package:flutter_weather/data/network/api_services.dart';
import 'package:flutter_weather/model/daily_weather_model.dart';
import 'package:flutter_weather/model/hourly_weather_model.dart';
import 'package:flutter_weather/repository/cache_repository.dart';
import 'package:flutter_weather/repository/weather_base_repository.dart';
import 'package:flutter_weather/res/values.dart';
import 'package:flutter_weather/util/network_util.dart';

import '../model/current_weather_model.dart';
import 'cache_base_repository.dart';

class WeatherRepository extends WeatherBaseRepository {
  final ApiDao _apiDao = ApiServices();
  //create current weather cache repository
  final CacheBaseRepository<CurrentWeather> _cacheCurrentWeatherRepository =
      CacheRepository<CurrentWeather>();

  //create daily weather cache repository
  final CacheBaseRepository<DailyWeather> _cacheDailyWeatherRepository =
      CacheRepository<DailyWeather>();

  //create hourly weather cache repository
  final CacheBaseRepository<HourlyWeather> _cacheHourlyWeatherRepository =
      CacheRepository<HourlyWeather>();

  //fetch current weather data
  @override
  Future<CurrentWeather> getCurrentWeather(
      {double? latitude, double? longitude, String? city}) async {
    //current weather end point
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&q=$city&appid=$apiKey&units=metric&exclude=minutely";
    try {
      final bool isOnLine = await NetworkUtil.isOnline();

      if (!isOnLine) {
        //If the user is offline then the current weather data will be returned from the cache
        debugPrint("Hit -> Cache Hit");
        return _cacheCurrentWeatherRepository
            .getDataFromCache(currentWeatherBox)
            .then((value) => value); //fetch data from cache
      } else {
        //if the user is online then fetch data from the internet and save it into cache to use later
        debugPrint("Hit -> URL Hit");
        var response = await _apiDao.getApiResponse(url);
        final data = weatherModelFromJson(response);

        _cacheCurrentWeatherRepository
            .clearCache(currentWeatherBox); //clear the old data from cache
        _cacheCurrentWeatherRepository.addToCache(
            data, currentWeatherBox); //add new data into the cache
        data.save(); //save data into the cache
        return data;
      }
    } catch (e) {
      debugPrint('CurrentWeatherError : $e');
      rethrow;
    }
  }

  //fetch daily weather data
  @override
  Future<DailyWeather> getDailyWeather(
      {double? latitude, double? longitude, String? city}) async {
    //daily weather end point
    String url =
        "https://api.weatherbit.io/v2.0/forecast/daily?city=$city&key=$weatherBitApiKey&lat=$latitude&lon=$longitude&units=m";

    try {
      final bool isOnLine = await NetworkUtil.isOnline();

      if (!isOnLine) {
        //If the user is offline then the daily weather data will be returned from the cache
        debugPrint("Hit -> Cache Hit");
        return _cacheDailyWeatherRepository
            .getDataFromCache(dailyWeatherBox)
            .then((value) => value); //fetch data from cache
      } else {
        //if the user is online then fetch data from the internet and save it into cache to use later
        debugPrint("Hit -> URL Hit");
        var response = await _apiDao.getApiResponse(url);
        final data = dailyWeatherModelFromJson(response);

        _cacheDailyWeatherRepository
            .clearCache(dailyWeatherBox); //clear the old data from cache
        _cacheDailyWeatherRepository.addToCache(
            data, dailyWeatherBox); //add new data into the cache
        data.save(); //save data into the cache

        return data;
      }
    } catch (e) {
      debugPrint('DailyWeatherError : $e');
      rethrow;
    }
  }

  //fetch hourly current weather
  @override
  Future<HourlyWeather> getCurrentWeatherHourly(
      {double? latitude, double? longitude, String? city}) async {
    //hourly weather end point
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&q=$city&appid=$apiKey&units=metric&cnt=12&exclude=hourly";

    try {
      final bool isOnLine = await NetworkUtil.isOnline();

      if (!isOnLine) {
        //If the user is offline then the hourly weather data will be returned from the cache
        return _cacheHourlyWeatherRepository
            .getDataFromCache(hourlyWeatherBox)
            .then((value) => value); //fetch data from cache
      } else {
        //if the user is online then fetch data from the internet and save it into cache to use later
        var response = await _apiDao.getApiResponse(url);
        final data = hourlyWeatherFromJson(response);

        _cacheHourlyWeatherRepository
            .clearCache(hourlyWeatherBox); //clear the old data from cache
        _cacheHourlyWeatherRepository.addToCache(
            data, hourlyWeatherBox); //add new data into the cache
        data.save(); //save data into the cache

        return data;
      }
    } catch (e) {
      debugPrint('HourlyWeatherError : $e');
      rethrow;
    }
  }
}
