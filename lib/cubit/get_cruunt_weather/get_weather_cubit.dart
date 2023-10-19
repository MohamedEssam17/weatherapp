import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_cruunt_weather/get_weather_state.dart';
import 'package:weatherapp/models/weather_models.dart';
import 'package:weatherapp/servers/weather_servers.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitalStateWeather());
   WeatherModels? weathermodel ;
  getweather({required String cityname}) async {
    try {
   weathermodel =
      await WeatherServers(Dio()).getCrunntweather(cityname: cityname);
      emit(WeatherLoadingstate());
}  catch (e) {
 emit(WeatherFailurestate());
}
  }
}
