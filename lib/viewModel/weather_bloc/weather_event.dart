import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable{
  const WeatherEvent();
}

class WeatherLoadingEvent extends WeatherEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class WeatherLoadedEvent extends WeatherEvent{
  final double latitude;
  final double longitude;
  final String city;

  const WeatherLoadedEvent({this.latitude = 0.0, this.longitude = 0.0, this.city = ''});

  @override
  // TODO: implement props
  List<Object?> get props => [longitude, longitude, city];
}

class WeatherErrorEvent extends WeatherEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}