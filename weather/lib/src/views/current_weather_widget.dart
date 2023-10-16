import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather/src/views/weather_image_widget.dart';

import '../models/CurrentWeather.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final CurrentWeather weatherData;

  CurrentWeatherWidget({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Météo actuelle',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          WeatherImageWidget(weatherCode : weatherData.weathercode ?? 0,),
          SizedBox(height: 10.0),
          Text(Jiffy.parse(weatherData.time!).yMMMEd),
          Text('${weatherData.temperature ?? "N/A"}°C - ${weatherData.windspeed ?? "N/A"} km/h'),
        ],
      ),
    );
  }
}
