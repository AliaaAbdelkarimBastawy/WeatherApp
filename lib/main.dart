import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Views/MainView.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import 'Views/ShowWeatherView.dart';

void main() {
  runApp(BlocProvider(
    create: (BuildContext context) => GetWeatherCubit(),
    child: Builder(
      builder: (context) =>
          BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(theme:
              ThemeData(
                  primarySwatch: getThemeColor(BlocProvider
                      .of<GetWeatherCubit>
                    (context)
                      .weatherModel
                      ?.weatherStatus)),
                debugShowCheckedModeBanner: false,
                home: const MainView(),);
            },
          ),
    ),
  ));
}

// class CustomMaterialWidget extends StatelessWidget {
//   const CustomMaterialWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder <GetWeatherCubit, WeatherState>(
//       builder: (context, state)
//       {
//         return MaterialApp(
//           theme: ThemeData(
//             /*This context gay abl el cubit, f hwa lessa msh bey-contain el cubit
//
//           primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>
//             (context).weatherModel.weatherStatus)*/
//               primarySwatch: getThemeColor(BlocProvider.of<GetWeatherCubit>
//                 (context).weatherModel?.weatherStatus)
//           ),
//           debugShowCheckedModeBanner: false,
//           home: const MainView(),);
//       },
//
//     );
//   }
// }


MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case "Clear":
      return Colors.yellow;
    case "Partly cloudy":
      return Colors.grey;
    case "Cloudy":
      return Colors.blueGrey;
    case "Rainy":
      return Colors.teal;
    default:
      return Colors.pink;
  }
}