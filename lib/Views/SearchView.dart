import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/WeatherModel.dart';
import 'package:weather_app/Services/getWeatherService.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController cityNameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City", style: TextStyle(color: Colors.white, fontSize: 18,),),
      ),
      body: Column(children: [
        const SizedBox(height: 120,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
           onFieldSubmitted: (value) async
            {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            controller: cityNameController,
            keyboardType: TextInputType.text,
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 32,
                horizontal: 16
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),),
                hintText: "Enter City Name",
                suffixIconColor: Colors.black54,
                suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.search,)),
              labelText: "Search",
            ),
            ),
          ),
      ],)
    );
  }
}

