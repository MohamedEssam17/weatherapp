import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_cruunt_weather/get_weather_cubit.dart';
import 'package:weatherapp/main.dart';
import 'package:weatherapp/models/weather_models.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModels weathermodel =
        BlocProvider.of<GetWeatherCubit>(context).weathermodel!;
        print(weathermodel.weathercondition);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            getThemeColor(weathermodel.weathercondition),
            getThemeColor(weathermodel.weathercondition)[300]!,
             getThemeColor(weathermodel.weathercondition)[50]!,

          ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weathermodel.cityname,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              Text(
                "Update at ${weathermodel.date.hour}:${weathermodel.date.minute}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              CachedNetworkImage(
  imageUrl: "https:${weathermodel.image}",
  placeholder: (context, url) => Center(
    child: CircularProgressIndicator(),
  ),
  errorWidget: (context, url, error) => Icon(Icons.error),
),
                  Text(
                    weathermodel.temp.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  Column(
                    children: [
                      Text('MaxTem : ${weathermodel.maxtemp.round()}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                      Text("MinTem : ${weathermodel.mintemp.round()}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                weathermodel.weathercondition,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
