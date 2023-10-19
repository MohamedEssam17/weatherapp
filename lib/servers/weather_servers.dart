
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weatherapp/models/weather_models.dart';

class WeatherServers
{
final Dio dio ;
final String baseurl = "http://api.weatherapi.com/v1";
final apikey = "bd2600c12af34bb9bdf192113231810";
WeatherServers(this.dio);
Future<WeatherModels> getCrunntweather({required String cityname}) async {
  try {
  Response response = await dio.get('$baseurl/forecast.json?key=$apikey&q=$cityname&days=1&aqi=no&alerts=no');
   WeatherModels weathermodel = WeatherModels.fromjson(response.data);
   return weathermodel;
} on DioException catch (e) {
 final String errormsg = e.response?.data["error"]["message"] ??" oops , try Later";
 throw Exception(errormsg);
}catch (e)
{
  log(e.toString());
  throw Exception("oops , Error try Later");
}
}
}
