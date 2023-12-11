import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';

import '../../Models/WeatherModel.dart';
import '../../Services/getWeatherService.dart';
import '../../Views/SearchView.dart';

// 2-Create Cubit

//This cubit is to manage state of HomeView
//Beyb2a 3andy differents cubits to manage different views

class GetWeatherCubit extends Cubit <WeatherState>
{
  /*
  Initial state = heya awel state beyakhoda el ui eli enta 3ayez
  te3melo manage.
  Khaly balek enta awel haga, el cubit beyb3at lel ui el state deh
   */

  GetWeatherCubit() : super(InitialNoWeatherState());
/*
- Ba3mel function w ahot gowaha el Logic eli beyhssal
- f el cubit yeb2a masek el logic/masek el function beta3ty
- f lama el logic da yetnafez in the future, lama el function deh yet3mlaha trigger
- w el function get executed
-f el cubit ye2dar yehaded eh eli beyhssal, w yekalem el ui w ye2olo eli beyhssal
-Awel ma el logic yentehy tanfezo, el cubit lazem yekalem el ui
- F ana mehtag eny anshe2 tare2et tawasol lel cubit ma3 el ui
-F el cubit beta3na beykalem el ui 3an tare2 el states
-F maslan law el cubit 2al lel lel ui "WeatherLoadedState"
-F el ui ye3raf en feh, data weslet, f yetharak w yeroh ye3red el data eli weslet
- F now, kol eli mehtagen ne3melo enena nekhali el cubit yestakhdem el states 3shan yekalem el ui
*/

   WeatherModel? weatherModel;
getWeather({required String cityName}) async {
  try {
     weatherModel = await WeatherService(Dio()).getCurrentWeather(city: cityName);
    //Hena keda el Logic kheles

    //Emit-method is used 3shan el cubit yeb3at el state deh, w yekalem el ui
    emit(WeatherLoadedSuccessfullyState(weatherModel!));
  }
  catch(e) {
    //El cubit hena beykalem el ui w bey2olo en fy moshkela hassalet
    emit(WeatherFailureState(e.toString()));
  }
}

}