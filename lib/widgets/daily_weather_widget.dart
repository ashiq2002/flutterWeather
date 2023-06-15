import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/res/values.dart';
import 'package:flutter_weather/viewModel/internet_bloc/internet_bloc.dart';
import 'package:flutter_weather/viewModel/internet_bloc/internet_state.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_bloc.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_event.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_state.dart';
import 'package:intl/intl.dart';

class DailyWeatherWidget extends StatelessWidget {
  final double latitude, longitude;
  const DailyWeatherWidget({
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
            if (weatherState is WeatherLoadedState) {
              return Container(
                height: 400,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.grey[300]?.withAlpha(150),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        "Next Days",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    _dailyWeatherList(weatherState)
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }

  Widget _dailyWeatherList(WeatherLoadedState state) => SizedBox(
        height: 300,
        child: ListView.builder(
            itemCount: state.dailyWeather.data!.length > 6
                ? 5
                : state.dailyWeather.data!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                      height: 60,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //name of the day
                          SizedBox(
                              width: 80,
                              child: Text(
                                _formatDate(state
                                    .dailyWeather.data![index + 1].datetime),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13),
                              )),
                          //weather icon
                          BlocBuilder<InternetBloc, InternetState>(builder: (context, internetState)=>SizedBox(
                            height: 30,
                            width: 30,
                            child: internetState is InternetGainedState? Image.network(
                          'https://cdn.weatherbit.io/static/img/icons/${state.dailyWeather.data![index].weather!.icon}.png')
                            : Image.asset('assets/weather/02n.png'),
                          ),),
                          //maximum and minimum temperature
                          Text(
                              "${state.dailyWeather.data![index].appMaxTemp}$degree/${state.dailyWeather.data![index].appMinTemp}"),
                        ],
                      )),
                  Container(
                    height: 1,
                    color: Colors.grey[300],
                  )
                ],
              );
            }),
      );

  //format the date
  String _formatDate(final date) {
    DateTime dateTime = DateTime.parse(date);
    final formatDate = DateFormat('EEE').format(dateTime);
    return formatDate;
  }
}
