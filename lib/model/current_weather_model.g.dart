// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrentWeatherAdapter extends TypeAdapter<CurrentWeather> {
  @override
  final int typeId = 0;

  @override
  CurrentWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrentWeather()
      .._weather = (fields[0] as List?)?.cast<Weather>()
      .._main = fields[1] as Main?
      .._wind = fields[2] as Wind?
      .._clouds = fields[3] as Clouds?
      .._dt = fields[4] as num?;
  }

  @override
  void write(BinaryWriter writer, CurrentWeather obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj._weather)
      ..writeByte(1)
      ..write(obj._main)
      ..writeByte(2)
      ..write(obj._wind)
      ..writeByte(3)
      ..write(obj._clouds)
      ..writeByte(4)
      ..write(obj._dt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CloudsAdapter extends TypeAdapter<Clouds> {
  @override
  final int typeId = 1;

  @override
  Clouds read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Clouds().._all = fields[0] as num?;
  }

  @override
  void write(BinaryWriter writer, Clouds obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj._all);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CloudsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WindAdapter extends TypeAdapter<Wind> {
  @override
  final int typeId = 2;

  @override
  Wind read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wind().._speed = fields[0] as num?;
  }

  @override
  void write(BinaryWriter writer, Wind obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj._speed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WindAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MainAdapter extends TypeAdapter<Main> {
  @override
  final int typeId = 3;

  @override
  Main read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Main()
      .._temp = fields[0] as num?
      .._humidity = fields[1] as num?;
  }

  @override
  void write(BinaryWriter writer, Main obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._temp)
      ..writeByte(1)
      ..write(obj._humidity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 4;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather()
      .._description = fields[0] as String?
      .._icon = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._description)
      ..writeByte(1)
      ..write(obj._icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
