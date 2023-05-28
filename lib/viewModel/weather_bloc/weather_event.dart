abstract class WeatherEvent{}

class WeatherLoadingEvent extends WeatherEvent{}
class CurrentWeatherLoadedEvent extends WeatherEvent{}
class DailyWeatherLoadedEvent extends WeatherEvent{}
class WeatherErrorEvent extends WeatherEvent{}