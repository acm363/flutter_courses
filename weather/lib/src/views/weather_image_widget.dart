import 'package:flutter/material.dart';

class WeatherImageWidget extends StatelessWidget {
  final int weatherCode;

  WeatherImageWidget({required this.weatherCode});

  @override
  Widget build(BuildContext context) {
    String imageUrl;

    if (weatherCode <= 3) {
      imageUrl = 'assets/images/sunny.png';
    } else if (weatherCode >= 45 && weatherCode <= 48) {
      imageUrl = 'assets/images/foggy.png';
    } else if (weatherCode >= 51 && weatherCode <= 55) {
      imageUrl = 'assets/images/rain.png';
    } else if (weatherCode >= 56 && weatherCode <= 57) {
      imageUrl = 'assets/images/snow.png';
    } else if (weatherCode >= 61 && weatherCode <= 65) {
      imageUrl = 'assets/images/rain.png';
    } else if (weatherCode >= 66 && weatherCode <= 77) {
      imageUrl = 'assets/images/snow.png';
    } else if (weatherCode >= 80 && weatherCode <= 82) {
      imageUrl = 'assets/images/rain.png';
    } else if (weatherCode >= 85 && weatherCode <= 86) {
      imageUrl = 'assets/images/snow.png';
    } else if (weatherCode >= 95 && weatherCode <= 99) {
      imageUrl = 'assets/images/storm.png';
    }
    else {
      imageUrl = 'assets/images/cloudy.png';
    }

    return CircleAvatar(
      radius: 50.0,
      backgroundImage: AssetImage(imageUrl),
    );
  }
}
