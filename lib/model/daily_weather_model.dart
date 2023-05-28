import 'dart:convert';

DailyWeather dailyWeatherModelFromJson(String str) => DailyWeather.fromJson(json.decode(str));
String dailyWeatherModelToJson(DailyWeather data) => json.encode(data.toJson());
class DailyWeather {
  DailyWeather({
      String? cityName, 
      String? countryCode, 
      List<Data>? data, 
      num? lat, 
      num? lon, 
      String? stateCode, 
      String? timezone,}){
    _cityName = cityName;
    _countryCode = countryCode;
    _data = data;
    _lat = lat;
    _lon = lon;
    _stateCode = stateCode;
    _timezone = timezone;
}

  DailyWeather.fromJson(dynamic json) {
    _cityName = json['city_name'];
    _countryCode = json['country_code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _lat = json['lat'];
    _lon = json['lon'];
    _stateCode = json['state_code'];
    _timezone = json['timezone'];
  }
  String? _cityName;
  String? _countryCode;
  List<Data>? _data;
  num? _lat;
  num? _lon;
  String? _stateCode;
  String? _timezone;
DailyWeather copyWith({  String? cityName,
  String? countryCode,
  List<Data>? data,
  num? lat,
  num? lon,
  String? stateCode,
  String? timezone,
}) => DailyWeather(  cityName: cityName ?? _cityName,
  countryCode: countryCode ?? _countryCode,
  data: data ?? _data,
  lat: lat ?? _lat,
  lon: lon ?? _lon,
  stateCode: stateCode ?? _stateCode,
  timezone: timezone ?? _timezone,
);
  String? get cityName => _cityName;
  String? get countryCode => _countryCode;
  List<Data>? get data => _data;
  num? get lat => _lat;
  num? get lon => _lon;
  String? get stateCode => _stateCode;
  String? get timezone => _timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city_name'] = _cityName;
    map['country_code'] = _countryCode;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['state_code'] = _stateCode;
    map['timezone'] = _timezone;
    return map;
  }

}


Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num? appMaxTemp, 
      num? appMinTemp, 
      num? clouds, 
      num? cloudsHi, 
      num? cloudsLow, 
      num? cloudsMid, 
      String? datetime, 
      num? dewpt, 
      num? highTemp, 
      num? lowTemp, 
      dynamic maxDhi, 
      num? maxTemp, 
      num? minTemp, 
      num? moonPhase, 
      num? moonPhaseLunation, 
      num? moonriseTs, 
      num? moonsetTs, 
      num? ozone, 
      num? pop, 
      num? precip, 
      num? pres, 
      num? rh, 
      num? slp, 
      num? snow, 
      num? snowDepth, 
      num? sunriseTs, 
      num? sunsetTs, 
      num? temp, 
      num? ts, 
      num? uv, 
      String? validDate, 
      num? vis, 
      Weather? weather, 
      String? windCdir, 
      String? windCdirFull, 
      num? windDir, 
      num? windGustSpd, 
      num? windSpd,}){
    _appMaxTemp = appMaxTemp;
    _appMinTemp = appMinTemp;
    _clouds = clouds;
    _cloudsHi = cloudsHi;
    _cloudsLow = cloudsLow;
    _cloudsMid = cloudsMid;
    _datetime = datetime;
    _dewpt = dewpt;
    _highTemp = highTemp;
    _lowTemp = lowTemp;
    _maxDhi = maxDhi;
    _maxTemp = maxTemp;
    _minTemp = minTemp;
    _moonPhase = moonPhase;
    _moonPhaseLunation = moonPhaseLunation;
    _moonriseTs = moonriseTs;
    _moonsetTs = moonsetTs;
    _ozone = ozone;
    _pop = pop;
    _precip = precip;
    _pres = pres;
    _rh = rh;
    _slp = slp;
    _snow = snow;
    _snowDepth = snowDepth;
    _sunriseTs = sunriseTs;
    _sunsetTs = sunsetTs;
    _temp = temp;
    _ts = ts;
    _uv = uv;
    _validDate = validDate;
    _vis = vis;
    _weather = weather;
    _windCdir = windCdir;
    _windCdirFull = windCdirFull;
    _windDir = windDir;
    _windGustSpd = windGustSpd;
    _windSpd = windSpd;
}

  Data.fromJson(dynamic json) {
    _appMaxTemp = json['app_max_temp'];
    _appMinTemp = json['app_min_temp'];
    _clouds = json['clouds'];
    _cloudsHi = json['clouds_hi'];
    _cloudsLow = json['clouds_low'];
    _cloudsMid = json['clouds_mid'];
    _datetime = json['datetime'];
    _dewpt = json['dewpt'];
    _highTemp = json['high_temp'];
    _lowTemp = json['low_temp'];
    _maxDhi = json['max_dhi'];
    _maxTemp = json['max_temp'];
    _minTemp = json['min_temp'];
    _moonPhase = json['moon_phase'];
    _moonPhaseLunation = json['moon_phase_lunation'];
    _moonriseTs = json['moonrise_ts'];
    _moonsetTs = json['moonset_ts'];
    _ozone = json['ozone'];
    _pop = json['pop'];
    _precip = json['precip'];
    _pres = json['pres'];
    _rh = json['rh'];
    _slp = json['slp'];
    _snow = json['snow'];
    _snowDepth = json['snow_depth'];
    _sunriseTs = json['sunrise_ts'];
    _sunsetTs = json['sunset_ts'];
    _temp = json['temp'];
    _ts = json['ts'];
    _uv = json['uv'];
    _validDate = json['valid_date'];
    _vis = json['vis'];
    _weather = json['weather'] != null ? Weather.fromJson(json['weather']) : null;
    _windCdir = json['wind_cdir'];
    _windCdirFull = json['wind_cdir_full'];
    _windDir = json['wind_dir'];
    _windGustSpd = json['wind_gust_spd'];
    _windSpd = json['wind_spd'];
  }
  num? _appMaxTemp;
  num? _appMinTemp;
  num? _clouds;
  num? _cloudsHi;
  num? _cloudsLow;
  num? _cloudsMid;
  String? _datetime;
  num? _dewpt;
  num? _highTemp;
  num? _lowTemp;
  dynamic _maxDhi;
  num? _maxTemp;
  num? _minTemp;
  num? _moonPhase;
  num? _moonPhaseLunation;
  num? _moonriseTs;
  num? _moonsetTs;
  num? _ozone;
  num? _pop;
  num? _precip;
  num? _pres;
  num? _rh;
  num? _slp;
  num? _snow;
  num? _snowDepth;
  num? _sunriseTs;
  num? _sunsetTs;
  num? _temp;
  num? _ts;
  num? _uv;
  String? _validDate;
  num? _vis;
  Weather? _weather;
  String? _windCdir;
  String? _windCdirFull;
  num? _windDir;
  num? _windGustSpd;
  num? _windSpd;
Data copyWith({  num? appMaxTemp,
  num? appMinTemp,
  num? clouds,
  num? cloudsHi,
  num? cloudsLow,
  num? cloudsMid,
  String? datetime,
  num? dewpt,
  num? highTemp,
  num? lowTemp,
  dynamic maxDhi,
  num? maxTemp,
  num? minTemp,
  num? moonPhase,
  num? moonPhaseLunation,
  num? moonriseTs,
  num? moonsetTs,
  num? ozone,
  num? pop,
  num? precip,
  num? pres,
  num? rh,
  num? slp,
  num? snow,
  num? snowDepth,
  num? sunriseTs,
  num? sunsetTs,
  num? temp,
  num? ts,
  num? uv,
  String? validDate,
  num? vis,
  Weather? weather,
  String? windCdir,
  String? windCdirFull,
  num? windDir,
  num? windGustSpd,
  num? windSpd,
}) => Data(  appMaxTemp: appMaxTemp ?? _appMaxTemp,
  appMinTemp: appMinTemp ?? _appMinTemp,
  clouds: clouds ?? _clouds,
  cloudsHi: cloudsHi ?? _cloudsHi,
  cloudsLow: cloudsLow ?? _cloudsLow,
  cloudsMid: cloudsMid ?? _cloudsMid,
  datetime: datetime ?? _datetime,
  dewpt: dewpt ?? _dewpt,
  highTemp: highTemp ?? _highTemp,
  lowTemp: lowTemp ?? _lowTemp,
  maxDhi: maxDhi ?? _maxDhi,
  maxTemp: maxTemp ?? _maxTemp,
  minTemp: minTemp ?? _minTemp,
  moonPhase: moonPhase ?? _moonPhase,
  moonPhaseLunation: moonPhaseLunation ?? _moonPhaseLunation,
  moonriseTs: moonriseTs ?? _moonriseTs,
  moonsetTs: moonsetTs ?? _moonsetTs,
  ozone: ozone ?? _ozone,
  pop: pop ?? _pop,
  precip: precip ?? _precip,
  pres: pres ?? _pres,
  rh: rh ?? _rh,
  slp: slp ?? _slp,
  snow: snow ?? _snow,
  snowDepth: snowDepth ?? _snowDepth,
  sunriseTs: sunriseTs ?? _sunriseTs,
  sunsetTs: sunsetTs ?? _sunsetTs,
  temp: temp ?? _temp,
  ts: ts ?? _ts,
  uv: uv ?? _uv,
  validDate: validDate ?? _validDate,
  vis: vis ?? _vis,
  weather: weather ?? _weather,
  windCdir: windCdir ?? _windCdir,
  windCdirFull: windCdirFull ?? _windCdirFull,
  windDir: windDir ?? _windDir,
  windGustSpd: windGustSpd ?? _windGustSpd,
  windSpd: windSpd ?? _windSpd,
);
  num? get appMaxTemp => _appMaxTemp;
  num? get appMinTemp => _appMinTemp;
  num? get clouds => _clouds;
  num? get cloudsHi => _cloudsHi;
  num? get cloudsLow => _cloudsLow;
  num? get cloudsMid => _cloudsMid;
  String? get datetime => _datetime;
  num? get dewpt => _dewpt;
  num? get highTemp => _highTemp;
  num? get lowTemp => _lowTemp;
  dynamic get maxDhi => _maxDhi;
  num? get maxTemp => _maxTemp;
  num? get minTemp => _minTemp;
  num? get moonPhase => _moonPhase;
  num? get moonPhaseLunation => _moonPhaseLunation;
  num? get moonriseTs => _moonriseTs;
  num? get moonsetTs => _moonsetTs;
  num? get ozone => _ozone;
  num? get pop => _pop;
  num? get precip => _precip;
  num? get pres => _pres;
  num? get rh => _rh;
  num? get slp => _slp;
  num? get snow => _snow;
  num? get snowDepth => _snowDepth;
  num? get sunriseTs => _sunriseTs;
  num? get sunsetTs => _sunsetTs;
  num? get temp => _temp;
  num? get ts => _ts;
  num? get uv => _uv;
  String? get validDate => _validDate;
  num? get vis => _vis;
  Weather? get weather => _weather;
  String? get windCdir => _windCdir;
  String? get windCdirFull => _windCdirFull;
  num? get windDir => _windDir;
  num? get windGustSpd => _windGustSpd;
  num? get windSpd => _windSpd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['app_max_temp'] = _appMaxTemp;
    map['app_min_temp'] = _appMinTemp;
    map['clouds'] = _clouds;
    map['clouds_hi'] = _cloudsHi;
    map['clouds_low'] = _cloudsLow;
    map['clouds_mid'] = _cloudsMid;
    map['datetime'] = _datetime;
    map['dewpt'] = _dewpt;
    map['high_temp'] = _highTemp;
    map['low_temp'] = _lowTemp;
    map['max_dhi'] = _maxDhi;
    map['max_temp'] = _maxTemp;
    map['min_temp'] = _minTemp;
    map['moon_phase'] = _moonPhase;
    map['moon_phase_lunation'] = _moonPhaseLunation;
    map['moonrise_ts'] = _moonriseTs;
    map['moonset_ts'] = _moonsetTs;
    map['ozone'] = _ozone;
    map['pop'] = _pop;
    map['precip'] = _precip;
    map['pres'] = _pres;
    map['rh'] = _rh;
    map['slp'] = _slp;
    map['snow'] = _snow;
    map['snow_depth'] = _snowDepth;
    map['sunrise_ts'] = _sunriseTs;
    map['sunset_ts'] = _sunsetTs;
    map['temp'] = _temp;
    map['ts'] = _ts;
    map['uv'] = _uv;
    map['valid_date'] = _validDate;
    map['vis'] = _vis;
    if (_weather != null) {
      map['weather'] = _weather?.toJson();
    }
    map['wind_cdir'] = _windCdir;
    map['wind_cdir_full'] = _windCdirFull;
    map['wind_dir'] = _windDir;
    map['wind_gust_spd'] = _windGustSpd;
    map['wind_spd'] = _windSpd;
    return map;
  }

}

/// icon : "c02d"
/// description : "Few clouds"
/// code : 801

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
String weatherToJson(Weather data) => json.encode(data.toJson());
class Weather {
  Weather({
      String? icon, 
      String? description, 
      num? code,}){
    _icon = icon;
    _description = description;
    _code = code;
}

  Weather.fromJson(dynamic json) {
    _icon = json['icon'];
    _description = json['description'];
    _code = json['code'];
  }
  String? _icon;
  String? _description;
  num? _code;
Weather copyWith({  String? icon,
  String? description,
  num? code,
}) => Weather(  icon: icon ?? _icon,
  description: description ?? _description,
  code: code ?? _code,
);
  String? get icon => _icon;
  String? get description => _description;
  num? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = _icon;
    map['description'] = _description;
    map['code'] = _code;
    return map;
  }

}