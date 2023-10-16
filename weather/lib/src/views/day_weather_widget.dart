import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather/src/models/DayWeather.dart';
import 'package:weather/src/views/weather_image_widget.dart';

class DayWeatherWidget extends StatelessWidget {
  final DayWeather dayWeather;

  const DayWeatherWidget({Key? key, required this.dayWeather});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('${Jiffy.parse(dayWeather.time!).yMMMEd} Min : ${dayWeather.temperature2mMax}°C  Max : ${dayWeather.temperature2mMin}°C'),
              Expanded(
                child: WeatherImageWidget(
                  weatherCode: dayWeather.weathercode!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
