import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather/data/network/api_dao.dart';
import 'package:flutter_weather/data/network/api_services.dart';
import 'package:flutter_weather/model/daily_weather_model.dart';
import 'package:flutter_weather/repository/base_local_storage_repository.dart';
import 'package:flutter_weather/repository/local_storage_repository.dart';
import 'package:flutter_weather/repository/weather_base_repository.dart';
import 'package:flutter_weather/res/values.dart';
import 'package:flutter_weather/util/network_util.dart';

import '../model/current_weather_model.dart';

class WeatherRepository extends WeatherBaseRepository{
  final ApiDao _apiDao = ApiServices();
  final BaseLocalStorageRepository _localStorageRepository = LocalStorageRepository();

  //fetch current weather data
  @override
  Future<CurrentWeather> getCurrentWeather({required double latitude, required double longitude}) async{
    var isCacheExist = await APICacheManager().isAPICacheKeyExist(currentWeatherCachesKey);
    //current weather end point
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric&exclude=minutely";
    try {
      final bool isOnLine = await NetworkUtil.isOnline();

      if(!isOnLine && isCacheExist){
        debugPrint("Hit -> Cache Hit");
        var currentWeatherCache = await _localStorageRepository.getCacheData(key: currentWeatherCachesKey);
        return weatherModelFromJson(currentWeatherCache.syncData);
      }else{
        debugPrint("Hit -> URL Hit");
        var response = await _apiDao.getApiResponse(url);
        _localStorageRepository.emptyCache();
        APICacheDBModel apiCacheDBModel = APICacheDBModel(key: currentWeatherCachesKey, syncData: response);
        _localStorageRepository.addCacheData(apiCacheDBModel: apiCacheDBModel);
        return weatherModelFromJson(response);
      }

    } catch (e) {
      rethrow;
    }
  }

  //fetch daily weather data
  @override
  Future<DailyWeather> getDailyWeather({required double latitude, required double longitude}) async{
    var isCacheExist = await APICacheManager().isAPICacheKeyExist(dailyWeatherCacheKey);
    //daily weather end point
    String url = "https://api.weatherbit.io/v2.0/forecast/daily?city=&key=$weatherBitApiKey&lat=$latitude&lon=$longitude&units=m";

    try {
      final bool isOnLine = await NetworkUtil.isOnline();

      if(!isOnLine && isCacheExist){
        debugPrint("Hit -> Cache Hit");
        var dailyWeatherCache = await _localStorageRepository.getCacheData(key: dailyWeatherCacheKey);
        return dailyWeatherModelFromJson(dailyWeatherCache.syncData);
       }else{
        debugPrint("Hit -> URL Hit");
        var response = await _apiDao.getApiResponse(url);
        _localStorageRepository.emptyCache();
        APICacheDBModel apiCacheDBModel = APICacheDBModel(key: dailyWeatherCacheKey, syncData: response);
        _localStorageRepository.addCacheData(apiCacheDBModel: apiCacheDBModel);
        return dailyWeatherModelFromJson(response);
      }

    } catch (e) {
      rethrow;
    }
  }


}
