import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_cruunt_weather/get_weather_cubit.dart';
import 'package:weatherapp/cubit/get_cruunt_weather/get_weather_state.dart';
import 'package:weatherapp/views/home_page.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weathermodel
                    ?.weathercondition,
              )),
              home:  Homepage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
   condition=condition?.toUpperCase().toLowerCase();
   if (condition == null) {
    return Colors.blue;
  } else if (condition == 'sunny' ||
      condition == 'clear' ||
      condition == 'partly cloudy') {
    return Colors.orange;
  } else if (condition == 'blizzard' ||
      condition == 'patchy snow possible' ||
      condition == 'patchy sleet possible' ||
      condition == 'patchy freezing drizzle possible' ||
      condition == 'blowing snow') {
    return Colors.blueGrey;
  } else if (condition == 'freezing fog' ||
      condition == 'fog' ||
      condition == 'heavy cloud' ||
      condition == 'mist') {
    return Colors.blueGrey;
  } else if (condition == 'patchy rain possible' ||
      condition == 'heavy rain' ||
      condition == 'showers') {
    return Colors.blue;
  } else if (condition == 'thundery outbreaks possible' ||
      condition == 'moderate or heavy snow with thunder' ||
      condition == 'patchy light snow with thunder' ||
      condition == 'moderate or heavy rain with thunder' ||
      condition == 'patchy light rain with thunder' ||
      condition == "moderate rain"
      ) 
      
       {
    return Colors.lightBlue;
  } else {
    return Colors.grey;
  }
}
