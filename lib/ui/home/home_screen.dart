import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/res/colors.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_bloc.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_event.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_state.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_bloc.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_event.dart';
import 'package:flutter_weather/widgets/daily_weather_widget.dart';
import 'package:flutter_weather/widgets/header_widget.dart';
import 'package:flutter_weather/widgets/hourly_current_weather_widget.dart';
import 'package:flutter_weather/widgets/my_appbar.dart';
import 'package:flutter_weather/widgets/notify_to_allow.dart';
import 'package:flutter_weather/widgets/current_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(LocationEvent());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
      return Scaffold(
          backgroundColor: appBackgroundColor,
          appBar: myAppBar(
              context: context,
              controller: controller,
              onPressed: () {
                debugPrint("Search : ${controller.text}");
                context.read<WeatherBloc>().add(WeatherLoadedEvent(city: controller.text.toString()));
                //FocusScope.of(context).unfocus();
              }),
          body: SafeArea(
              child: locationState is LocationLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : locationState is LocationGrantedState
                      ? ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            //display current weather data
                            CurrentWeatherWidget(
                              latitude: locationState.latitude,
                              longitude: locationState.longitude,
                            ),

                            const SizedBox(
                              height: 30,
                            ),
                            //display hourly current weather list
                            HourlyCurrentWeatherWidget(
                              latitude: locationState.latitude,
                              longitude: locationState.longitude,
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            //show daily weather data
                            DailyWeatherWidget(
                              latitude: locationState.latitude,
                              longitude: locationState.longitude,
                            ),
                          ],
                        )
                      : NotifyToAllowLocation(
                          onPressed: () {
                            context.read<LocationBloc>().add(LocationEvent());
                          },
                        )));
    });
  }
}
