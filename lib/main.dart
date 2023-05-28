import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:flutter_weather/viewModel/internet_bloc/internet_bloc.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_bloc.dart';
import 'package:flutter_weather/ui/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          BlocProvider<LocationBloc>(create: (_)=> LocationBloc()),
          BlocProvider<InternetBloc>(create: (_)=> InternetBloc()),
          RepositoryProvider(create: (_)=> WeatherRepository()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: "laila"
          ),
          home: const HomeScreen(),
        ));
  }
}
