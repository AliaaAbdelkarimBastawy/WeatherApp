
import 'dart:core';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/WeatherModel.dart';

//2- Ben-create the service
class WeatherService
{
  final Dio dio;
  final String baseUrl= "http://api.weatherapi.com/v1";
  final String apiKey = "18725003fce04924904175234231711";
  WeatherService(this.dio);

 Future<WeatherModel> getCurrentWeather({required String city}) async
 {
   try {
     //Da el response eli beyrg3 in case en mafesh moshkela
     Response response = await
     dio.get("$baseUrl/forecast.json?key=$apiKey&q=$city&days=1");
     WeatherModel weatherModel = WeatherModel.fromJson(response.data);
     return weatherModel;
   }
   on DioException catch(e) //ana hena b-handle el mawdo3 law hassal dioException bas
   {
     //Dio betrmy dio exception in case of bad request "error", no need to check on status Code
     // Just bahot try and catch, w hya internally bett-check in status code
     //in case of using http, we have to check on status of response

     //Da response gher eli fo2, beyrga3 in case of el error
     final String errorMessage = e.response?.data['error']['message'] ??
         "oops,There was an error, try later";
     throw Exception(errorMessage);
   }

   catch(e)
   {
     log(e.toString());
     throw Exception("oops,There was an error, try later");
   }

 }

}