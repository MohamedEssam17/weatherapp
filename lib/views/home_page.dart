import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_cruunt_weather/get_weather_cubit.dart';
import 'package:weatherapp/cubit/get_cruunt_weather/get_weather_state.dart';
import 'package:weatherapp/views/serach_view.dart';
import 'package:weatherapp/widget/no_weather.dart';
import 'package:weatherapp/widget/weather_body.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather App"), actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const Serachpage();
            }));
          },
          icon: const Icon(Icons.search),
        )
      ]),
      body: BlocBuilder<GetWeatherCubit,WeatherState>(builder: (context, state) {
        if (state is InitalStateWeather ) {
          return  Noweatherbody();
        }else if(state is WeatherLoadingstate)
        {
          return  WeatherInfo();
        }else{
         return const Text("Failed information");
        }
      },),
    );
  }
}
