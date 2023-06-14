import 'dart:convert';

import 'package:hive/hive.dart';
part 'current_weather_model.g.dart';

CurrentWeather weatherModelFromJson(String str) =>
    CurrentWeather.fromJson(json.decode(str));

String weatherModelToJson(CurrentWeather data) => json.encode(data.toJson());

@HiveType(typeId: 0)
class CurrentWeather extends HiveObject{
  Coord? _coord;
  @HiveField(0)
  List<Weather>? _weather;
  String? _base;
  @HiveField(1)
  Main? _main;
  num? _visibility;
  @HiveField(2)
  Wind? _wind;
  @HiveField(3)
  Clouds? _clouds;
  @HiveField(4)
  num? _dt;
  Sys? _sys;
  num? _timezone;
  num? _id;
  String? _name;
  num? _cod;

  CurrentWeather({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    num? dt,
    Sys? sys,
    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) {
    _coord = coord;
    _weather = weather;
    _base = base;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _clouds = clouds;
    _dt = dt;
    _sys = sys;
    _timezone = timezone;
    _id = id;
    _name = name;
    _cod = cod;
  }

  CurrentWeather.fromJson(dynamic json) {
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }

  CurrentWeather copyWith({
    Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    num? visibility,
    Wind? wind,
    Clouds? clouds,
    num? dt,
    Sys? sys,
    num? timezone,
    num? id,
    String? name,
    num? cod,
  }) =>
      CurrentWeather(
        coord: coord ?? _coord,
        weather: weather ?? _weather,
        base: base ?? _base,
        main: main ?? _main,
        visibility: visibility ?? _visibility,
        wind: wind ?? _wind,
        clouds: clouds ?? _clouds,
        dt: dt ?? _dt,
        sys: sys ?? _sys,
        timezone: timezone ?? _timezone,
        id: id ?? _id,
        name: name ?? _name,
        cod: cod ?? _cod,
      );
  Coord? get coord => _coord;
  List<Weather>? get weather => _weather;
  String? get base => _base;
  Main? get main => _main;
  num? get visibility => _visibility;
  Wind? get wind => _wind;
  Clouds? get clouds => _clouds;
  num? get dt => _dt;
  Sys? get sys => _sys;
  num? get timezone => _timezone;
  num? get id => _id;
  String? get name => _name;
  num? get cod => _cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = _base;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    map['visibility'] = _visibility;
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    map['dt'] = _dt;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['timezone'] = _timezone;
    map['id'] = _id;
    map['name'] = _name;
    map['cod'] = _cod;
    return map;
  }
}

/// country : "BD"
/// sunrise : 1685056606
/// sunset : 1685105015

Sys sysFromJson(String str) => Sys.fromJson(json.decode(str));
String sysToJson(Sys data) => json.encode(data.toJson());

class Sys {
  String? _country;
  num? _sunrise;
  num? _sunset;
  Sys({
    String? country,
    num? sunrise,
    num? sunset,
  }) {
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
  }

  Sys.fromJson(dynamic json) {
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }

  Sys copyWith({
    String? country,
    num? sunrise,
    num? sunset,
  }) =>
      Sys(
        country: country ?? _country,
        sunrise: sunrise ?? _sunrise,
        sunset: sunset ?? _sunset,
      );
  String? get country => _country;
  num? get sunrise => _sunrise;
  num? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = _country;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }
}

/// all : 0

Clouds cloudsFromJson(String str) => Clouds.fromJson(json.decode(str));
String cloudsToJson(Clouds data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class Clouds {
  @HiveField(0)
  num? _all;

  Clouds({
    num? all,
  }) {
    _all = all;
  }

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }

  Clouds copyWith({
    num? all,
  }) =>
      Clouds(
        all: all ?? _all,
      );
  num? get all => _all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }
}

/// speed : 2.01
/// deg : 129
/// gust : 2.57

Wind windFromJson(String str) => Wind.fromJson(json.decode(str));
String windToJson(Wind data) => json.encode(data.toJson());

@HiveType(typeId: 2)
class Wind {
  @HiveField(0)
  num? _speed;
  num? _deg;
  num? _gust;

  Wind({
    num? speed,
    num? deg,
    num? gust,
  }) {
    _speed = speed;
    _deg = deg;
    _gust = gust;
  }

  Wind.fromJson(dynamic json) {
    _speed = json['speed'];
    _deg = json['deg'];
    _gust = json['gust'];
  }

  Wind copyWith({
    num? speed,
    num? deg,
    num? gust,
  }) =>
      Wind(
        speed: speed ?? _speed,
        deg: deg ?? _deg,
        gust: gust ?? _gust,
      );
  num? get speed => _speed;
  num? get deg => _deg;
  num? get gust => _gust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = _speed;
    map['deg'] = _deg;
    map['gust'] = _gust;
    return map;
  }
}

/// temp : 33.79
/// feels_like : 36.4
/// temp_min : 33.79
/// temp_max : 33.79
/// pressure : 1004
/// humidity : 45
/// sea_level : 1004
/// grnd_level : 1002

Main mainFromJson(String str) => Main.fromJson(json.decode(str));
String mainToJson(Main data) => json.encode(data.toJson());

@HiveType(typeId: 3)
class Main {
  @HiveField(0)
  num? _temp;
  num? _feelsLike;
  num? _tempMin;
  num? _tempMax;
  num? _pressure;
  @HiveField(1)
  num? _humidity;
  num? _seaLevel;
  num? _grndLevel;
  Main({
    num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
    num? seaLevel,
    num? grndLevel,
  }) {
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _humidity = humidity;
    _seaLevel = seaLevel;
    _grndLevel = grndLevel;
  }

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _seaLevel = json['sea_level'];
    _grndLevel = json['grnd_level'];
  }

  Main copyWith({
    num? temp,
    num? feelsLike,
    num? tempMin,
    num? tempMax,
    num? pressure,
    num? humidity,
    num? seaLevel,
    num? grndLevel,
  }) =>
      Main(
        temp: temp ?? _temp,
        feelsLike: feelsLike ?? _feelsLike,
        tempMin: tempMin ?? _tempMin,
        tempMax: tempMax ?? _tempMax,
        pressure: pressure ?? _pressure,
        humidity: humidity ?? _humidity,
        seaLevel: seaLevel ?? _seaLevel,
        grndLevel: grndLevel ?? _grndLevel,
      );
  num? get temp => _temp;
  num? get feelsLike => _feelsLike;
  num? get tempMin => _tempMin;
  num? get tempMax => _tempMax;
  num? get pressure => _pressure;
  num? get humidity => _humidity;
  num? get seaLevel => _seaLevel;
  num? get grndLevel => _grndLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    map['sea_level'] = _seaLevel;
    map['grnd_level'] = _grndLevel;
    return map;
  }
}

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01d"

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
String weatherToJson(Weather data) => json.encode(data.toJson());

@HiveType(typeId: 4)
class Weather {
  num? _id;
  String? _main;
  @HiveField(0)
  String? _description;
  @HiveField(1)
  String? _icon;

  Weather({
    num? id,
    String? main,
    String? description,
    String? icon,
  }) {
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
  }

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }

  Weather copyWith({
    num? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      Weather(
        id: id ?? _id,
        main: main ?? _main,
        description: description ?? _description,
        icon: icon ?? _icon,
      );
  num? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }
}

/// lon : 89.2413
/// lat : 24.0147

Coord coordFromJson(String str) => Coord.fromJson(json.decode(str));
String coordToJson(Coord data) => json.encode(data.toJson());

class Coord {
  num? _lon;
  num? _lat;
  Coord({
    num? lon,
    num? lat,
  }) {
    _lon = lon;
    _lat = lat;
  }

  Coord.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }

  Coord copyWith({
    num? lon,
    num? lat,
  }) =>
      Coord(
        lon: lon ?? _lon,
        lat: lat ?? _lat,
      );
  num? get lon => _lon;
  num? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }
}
