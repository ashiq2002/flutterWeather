// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyWeatherAdapter extends TypeAdapter<DailyWeather> {
  @override
  final int typeId = 5;

  @override
  DailyWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyWeather().._data = (fields[0] as List?)?.cast<Data>();
  }

  @override
  void write(BinaryWriter writer, DailyWeather obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj._data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 6;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data()
      .._appMaxTemp = fields[0] as num?
      .._appMinTemp = fields[1] as num?
      .._datetime = fields[2] as String?
      .._weather = fields[3] as Weather?;
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj._appMaxTemp)
      ..writeByte(1)
      ..write(obj._appMinTemp)
      ..writeByte(2)
      ..write(obj._datetime)
      ..writeByte(3)
      ..write(obj._weather);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherDailyAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 7;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather().._icon = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj._icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDailyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
