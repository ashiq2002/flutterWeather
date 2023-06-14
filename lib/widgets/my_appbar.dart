import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/viewModel/appbar_cubit/appbar_cubit.dart';
import 'package:flutter_weather/viewModel/appbar_cubit/appbar_state.dart';

myAppBar(
        {required BuildContext context,
        required TextEditingController controller, required VoidCallback? onPressed}) =>
    PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: BlocBuilder<AppBarCubit, AppBarState>(
          builder: (context, state) => AppBar(
                title: state.isSearchClick
                    ? TextField(
                        controller: controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search by city',
                          hintStyle: const TextStyle(color: Colors.white70),
                          suffixIcon: IconButton(onPressed: onPressed, icon: const Icon(Icons.search_rounded, color: Colors.white70,))
                        ),
                      )
                    : const Text("Weather"),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        context.read<AppBarCubit>().updateState();
                        if(!state.isSearchClick){
                          controller.clear();
                        }
                      },
                      icon: Icon(
                          state.isSearchClick ? Icons.close : Icons.search)),
                ],
              )),
    );
