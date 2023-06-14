// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourlyWeatherAdapter extends TypeAdapter<HourlyWeather> {
  @override
  final int typeId = 8;

  @override
  HourlyWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourlyWeather()
      .._list = (fields[0] as List?)?.cast<CurrentWeather>();
  }

  @override
  void write(BinaryWriter writer, HourlyWeather obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj._list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
