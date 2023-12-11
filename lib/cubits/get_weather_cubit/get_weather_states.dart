

import 'package:weather_app/Models/WeatherModel.dart';

class WeatherState{}

// 1-Create States

/*
Elmafrod el cubit fy elawal, yekalem el UI w yeb3atlo "InitialNoWeatherState" as initial state
*/
class InitialNoWeatherState extends WeatherState{}
class WeatherLoadedSuccessfullyState extends WeatherState{
  final WeatherModel weatherModel;
  WeatherLoadedSuccessfullyState(this.weatherModel);

}
class WeatherFailureState extends WeatherState{
  final String errorMessage;
  WeatherFailureState(this.errorMessage);
}