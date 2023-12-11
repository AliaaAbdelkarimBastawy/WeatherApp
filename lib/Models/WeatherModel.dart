//1- Awel haga ben3mel el model
//Create the factory Constructor
//[check datatypes]

class WeatherModel
{
  late final String cityName;
  late final DateTime date;
  late final String? image;
  late final double minTemp;
  late final double maxTemp;
  late final double avgTemp;
  late final String weatherStatus;


  WeatherModel({required this.cityName,
  required this.date, required this.image,
    required this.maxTemp, required this.minTemp, required this.avgTemp,
    required this.weatherStatus});


  factory WeatherModel.fromJson(json)
  {
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherStatus: json['forecast']['forecastday'][0]['day']['condition']['text'],);
  }

}


