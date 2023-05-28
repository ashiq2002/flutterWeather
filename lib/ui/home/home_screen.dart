import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/res/colors.dart';
import 'package:flutter_weather/viewModel/internet_bloc/internet_bloc.dart';
import 'package:flutter_weather/viewModel/internet_bloc/internet_state.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_bloc.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_event.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_state.dart';
import 'package:flutter_weather/widgets/daily_weather_widget.dart';
import 'package:flutter_weather/widgets/header_widget.dart';
import 'package:flutter_weather/widgets/notify_to_allow.dart';
import 'package:flutter_weather/widgets/current_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(LocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
      return Scaffold(
          backgroundColor: appBackgroundColor,
          appBar: AppBar(
            title: const Text("Weather"),
            centerTitle: true,
          ),
          body: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, internetState) {
              if (internetState is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  dismissDirection: DismissDirection.endToStart,
                  content: Text(
                    'Internet connected',
                  ),
                  backgroundColor: Colors.green,
                ));
              } else if (internetState is InternetLostState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  dismissDirection: DismissDirection.endToStart,
                  content: Text(
                    'Connection lost',
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              if (state is InternetGainedState || state is InternetLostState || state is InternetInitialState) {
                return SafeArea(
                    child: locationState is LocationLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : locationState is LocationGrantedState
                            ? ListView(
                                scrollDirection: Axis.vertical,
                                children: [
                                  HeaderWidget(
                                    lat: locationState.latitude,
                                    lon: locationState.longitude,
                                  ),

                                  const SizedBox(
                                    height: 30,
                                  ),
                                  //display current weather data
                                  CurrentWeatherWidget(
                                    latitude: locationState.latitude,
                                    longitude: locationState.longitude,
                                  ),

                                  const SizedBox(height: 20,),

                                  //show daily weather data
                                  DailyWeatherWidget(
                                    latitude: locationState.latitude,
                                    longitude: locationState.longitude,
                                  ),
                                ],
                              )
                            : NotifyToAllowLocation(
                                onPressed: () {
                                  context
                                      .read<LocationBloc>()
                                      .add(LocationEvent());
                                },
                              ));
              }
              return const SizedBox();
            },
          ));
    });
  }
}
