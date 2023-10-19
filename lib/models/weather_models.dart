class WeatherModels {
  final String? image;
  final String cityname;
  final DateTime date;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String weathercondition;
  WeatherModels(
      {required this.image,
      required this.cityname,
      required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weathercondition});
  factory WeatherModels.fromjson(json) {
    return WeatherModels(
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      cityname: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weathercondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
