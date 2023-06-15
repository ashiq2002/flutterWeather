import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/viewModel/appbar_cubit/appbar_cubit.dart';
import 'package:flutter_weather/viewModel/appbar_cubit/appbar_state.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_bloc.dart';
import 'package:flutter_weather/viewModel/weather_bloc/weather_event.dart';

myAppBar(
        {required BuildContext context,
        required TextEditingController controller, required VoidCallback? onPressed}) =>
    PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: BlocBuilder<AppBarCubit, AppBarState>(
          builder: (context, state) => AppBar(
                title: state.isSearchClick
                //if the isSearchClick is true the set the TextField as a searchbar on title
                    ? TextField(
                        controller: controller,
                        style: const TextStyle(color: Colors.white),
                        autofocus: true,
                        onTapOutside: (event){
                          FocusScope.of(context).unfocus(); //dismiss the keyboard when user tap to outside on TextField
                          debugPrint('onTapOutside : $event');
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search by city',
                          hintStyle: const TextStyle(color: Colors.white70),

                          suffixIcon: IconButton(onPressed: (){
                            FocusScope.of(context).unfocus(); //dismiss the keyboard when user tap on the search button
                            context.read<AppBarCubit>().updateAppbarState(); //update the appbar state when user tap on the search button

                            if(controller.text.isNotEmpty){
                              //add the WeatherLoadedEvent when user search weather by city and at the same time the TextField is not empty
                              context.read<WeatherBloc>().add(WeatherLoadedEvent(city: controller.text.toString()));
                            }
                          }, icon: const Icon(Icons.search_rounded, color: Colors.white70,))
                        ),
                      )
                    : const Text("Weather"),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<AppBarCubit>().updateAppbarState();
                        if(!state.isSearchClick){
                          controller.clear();
                        }
                      },
                      icon: Icon(
                          state.isSearchClick ? Icons.close : Icons.search)),
                ],
              )),
    );
