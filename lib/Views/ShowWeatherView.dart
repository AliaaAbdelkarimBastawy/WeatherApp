import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/main.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import 'SearchView.dart';

class ShowWeatherView extends StatefulWidget {
  // WeatherModel weatherModel;
   ShowWeatherView({Key? key,}) : super(key: key);

  @override
  State<ShowWeatherView> createState() => _ShowWeatherViewState();
}

class _ShowWeatherViewState extends State<ShowWeatherView> {
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    bool CheckImageHttps = weatherModel.image!.contains("https:");
    return  Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                getThemeColor(weatherModel.weatherStatus),
                getThemeColor(weatherModel.weatherStatus)[300]!,
                getThemeColor(weatherModel.weatherStatus)[50]!,

              ],
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherModel.cityName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
          const SizedBox(height: 5,),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text("Updated at:"),
            const SizedBox(width: 5,),
            Text("${weatherModel.date.hour}:${weatherModel.date.minute}"),
          ],),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SizedBox(height: 200, width: 100,
                child:CheckImageHttps? Image.network(weatherModel.image!):Image.network("https:${weatherModel.image}"),),
                Text("${weatherModel.avgTemp.round()}" , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),

                Column(children: [
                Row(children: [
                  const Text("maxTemp:"),
                  const SizedBox(width: 5,),
                  Text("${weatherModel.maxTemp.round()}"),
                ],),
                const SizedBox(height: 3,),
                 Row(children: [
                  const Text("minTemp:"),
                  const SizedBox(width: 5,),
                  Text("${weatherModel.minTemp.round()}"),
                ],)
              ],),

            ],),
          ),
           Text(weatherModel.weatherStatus, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),

        ],),
      );
  }
}


