import 'dart:convert';

import 'package:flutter_weather/model/current_weather_model.dart';
import 'package:hive/hive.dart';

part 'hourly_weather_model.g.dart';

HourlyWeather hourlyWeatherFromJson(String str) => HourlyWeather.fromJson(json.decode(str));
String hourlyWeatherToJson(HourlyWeather data) => json.encode(data.toJson());

@HiveType(typeId: 8)
class HourlyWeather extends HiveObject{
  @HiveField(0)
  List<CurrentWeather>? _list;

  HourlyWeather({
      List<CurrentWeather>? list,}){
    _list = list;
}

  HourlyWeather.fromJson(dynamic json) {
    if (json['list'] != null) {
      _list = [];
      json['list'].forEach((v) {
        _list?.add(CurrentWeather.fromJson(v));
      });
    }
  }

HourlyWeather copyWith({
  List<CurrentWeather>? list,
}) => HourlyWeather(
  list: list ?? _list,
);

  List<CurrentWeather>? get list => _list;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_list != null) {
      map['list'] = _list?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}