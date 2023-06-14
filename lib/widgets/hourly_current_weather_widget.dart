import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/model/current_weather_model.dart';
import 'package:flutter_weather/res/colors.dart';
import 'package:flutter_weather/res/values.dart';
import 'package:flutter_weather/viewModel/selected_cubit/selected_item_cubit.dart';
import 'package:flutter_weather/viewModel/selected_cubit/selected_state.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_bloc.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_event.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_state.dart';
import 'package:intl/intl.dart';

class HourlyCurrentWeatherWidget extends StatelessWidget {
  final double latitude, longitude;
  const HourlyCurrentWeatherWidget({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {
    context
        .read<WeatherBloc>()
        .add(WeatherLoadedEvent(latitude: latitude, longitude: longitude));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today Forecast',
            style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.w500, height: 2),
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeatherLoadedState) {
                return Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey[300]?.withAlpha(150),
                      borderRadius: BorderRadius.circular(15)),
                  //Hourly current weather list
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return BlocBuilder<SelectedItemCubit, SelectedSate>(
                            builder: (context, selectedState) =>
                                GestureDetector(
                                  onTap: () {
                                    selectedState.index =
                                        index; //update selected item index
                                    context
                                        .read<SelectedItemCubit>()
                                        .updateSelectedItemState();
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        color: selectedState.index == index
                                            ? cardSelectedColor
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: _hourlyWeather(
                                        color: selectedState.index == index
                                            ? white
                                            : black,
                                        weather:
                                            state.hourlyWeather.list![index]),
                                  ),
                                ));
                      }),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}

//set hourly weather data into the view
Widget _hourlyWeather(
        {required Color color, required CurrentWeather weather}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //time
        Text(
          _getTime(weather.dt),
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: color),
        ),
        //icon
        Image.asset(
          'assets/weather/${weather.weather![0].icon}.png',
          height: 42,
          width: 42,
        ),
        //temperature
        Text('${weather.main!.temp}$degree',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: color))
      ],
    );

//convert time
String _getTime(final timeStamp) {
  DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  String t = DateFormat('jm').format(time);
  return t;
}
