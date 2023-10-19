import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/cubit/get_cruunt_weather/get_weather_cubit.dart';

class Serachpage extends StatelessWidget {
  const Serachpage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Serach a city"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value){
              var getweahtercubit= BlocProvider.of<GetWeatherCubit>(context);
              getweahtercubit.getweather(cityname: value);
             Navigator.pop(context);
            },
           decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
            hintText: "Enter city name",
            contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 16) ,
            label: Text("serach"),
            border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          
            ),
           
           ),
          ),
          
        ),
      )
    );
  }
}
