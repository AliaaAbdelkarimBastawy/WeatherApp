import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Views/SearchView.dart';
import 'package:weather_app/Views/ShowWeatherView.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import 'NoWeatherView.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App", style: TextStyle(color: Colors.white, fontSize: 18,),),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)
          {
            return SearchView();
          },
          ));
        }, icon: const Icon(Icons.search, color: Colors.white,))],),

      body: BlocBuilder <GetWeatherCubit, WeatherState>(
        builder: (BuildContext context, state) {
          if(state is InitialNoWeatherState) {
              return const NoWeatherView();
            }
          else if (state is WeatherLoadedSuccessfullyState) {
              return ShowWeatherView();
            }
          else
            {
              return const Text("OOPS, there was an error");
            }

      },),
    );
  }
}
