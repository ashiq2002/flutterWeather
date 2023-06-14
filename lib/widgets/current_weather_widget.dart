import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/res/values.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_bloc.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_event.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_state.dart';

import 'header_widget.dart';

//for the current weather data
class CurrentWeatherWidget extends StatelessWidget {
  final double latitude, longitude;
  const CurrentWeatherWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<WeatherBloc>()
        .add(WeatherLoadedEvent(latitude: latitude, longitude: longitude));

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, weatherState) {
            if (weatherState is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (weatherState is WeatherLoadedState) {
              return Column(
                children: [
                  //display user current location
                  HeaderWidget(
                    lat: weatherState.currentWeather.coord!.lat!.toDouble(),
                    lon: weatherState.currentWeather.coord!.lon!.toDouble(),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  //current weather temp, icon, description
                  _currentWeather(weatherState),
                  const SizedBox(
                    height: 20,
                  ),
                  //current weather wind speed, cloud, humidity
                  _currentWeatherDetail(weatherState),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }

  //current temperature, description and icon
  Widget _currentWeather(WeatherLoadedState weatherLoadedState) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //icon
          Image.asset(
            'assets/weather/${weatherLoadedState.currentWeather.weather![0].icon}.png',
            width: 74,
            height: 74,
          ),
          //vertical divider
          SizedBox(
            height: 50,
            child: VerticalDivider(
              thickness: 1,
              color: Colors.grey[300],
            ),
          ),
          RichText(
              text: TextSpan(children: [
            //temperature
            TextSpan(
                text:
                    "${weatherLoadedState.currentWeather.main!.temp!.toInt()}$degree",
                style: const TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
            //description
            TextSpan(
                text:
                    "${weatherLoadedState.currentWeather.weather![0].description}",
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400)),
          ])),
        ],
      );

  //weather icon tile
  Widget _iconTile({required String iconPath}) => Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
        child: Image.asset(iconPath),
      );

  //weather more details widget
  Widget _currentWeatherDetail(WeatherLoadedState weatherLoadedState) => Column(
        children: [
          //weather icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _iconTile(iconPath: 'assets/icon/windspeed.png'),
              _iconTile(iconPath: 'assets/icon/cloud.png'),
              _iconTile(iconPath: 'assets/icon/humidity.png'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //weather text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _weatherText(
                  "${weatherLoadedState.currentWeather.wind!.speed}km/h"),
              _weatherText("${weatherLoadedState.currentWeather.clouds!.all}%"),
              _weatherText(
                  "${weatherLoadedState.currentWeather.main!.humidity}%"),
            ],
          )
        ],
      );

  //weather detail text
  Widget _weatherText(String text) => Expanded(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      );
}
