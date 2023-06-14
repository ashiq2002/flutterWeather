import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/model/current_weather_model.dart';
import 'package:flutter_weather/model/daily_weather_model.dart';
import 'package:flutter_weather/model/hourly_weather_model.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:flutter_weather/res/values.dart';
import 'package:flutter_weather/viewModel/appbar_cubit/appbar_cubit.dart';
import 'package:flutter_weather/viewModel/internet_bloc/internet_bloc.dart';
import 'package:flutter_weather/viewModel/locationBloc//location_bloc.dart';
import 'package:flutter_weather/ui/home/home_screen.dart';
import 'package:flutter_weather/viewModel/selected_cubit/selected_item_cubit.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  //register current weather adapters
  Hive.registerAdapter(CurrentWeatherAdapter());
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(MainAdapter());
  Hive.registerAdapter(WindAdapter());
  Hive.registerAdapter(CloudsAdapter());

  //register daily weather adapters
  Hive.registerAdapter(DailyWeatherAdapter());
  Hive.registerAdapter(DataAdapter());
  Hive.registerAdapter(WeatherDailyAdapter());

  //register hourly weather adapter
  Hive.registerAdapter(HourlyWeatherAdapter());

  //open box
  await Hive.openBox<CurrentWeather>(currentWeatherBox);
  await Hive.openBox<DailyWeather>(dailyWeatherBox);
  await Hive.openBox<HourlyWeather>(hourlyWeatherBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LocationBloc>(create: (_)=> LocationBloc(), lazy: true,),
          BlocProvider<InternetBloc>(create: (_)=> InternetBloc()),
          BlocProvider<SelectedItemCubit>(create: (_)=> SelectedItemCubit()),
          BlocProvider<AppBarCubit>(create: (_)=> AppBarCubit()),
          BlocProvider<WeatherBloc>(create: (_)=> WeatherBloc(weatherRepository: WeatherRepository())),
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
