import 'package:flutter/material.dart';
import 'package:weather/src/models/Daily.dart';
import 'package:weather/src/models/DayWeather.dart';
import 'package:weather/src/models/WeatherData.dart';
import 'package:weather/src/views/controller_widget.dart';
import 'package:weather/src/views/current_weather_widget.dart';
import 'package:weather/src/views/day_weather_widget.dart';
import 'package:weather/src/views/loading_widget.dart';

import '../models/CurrentWeather.dart';
import '../services/weather_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _longitude = 52.52;
  double _latitude = 13.41;
  WeatherData _weatherData = WeatherData(
    currentWeather: CurrentWeather(
      time: DateTime.now().toIso8601String(),
      temperature: 0,
      windspeed: 0,
      winddirection: 0,
      isDay: 0,
      weathercode: 0,
    ),
    daily: Daily(
      time: [],
      weathercode: [],
    ),
  );
  CurrentWeather _currentWeather = CurrentWeather(
    time: DateTime.now().toIso8601String(),
    temperature: 0,
    windspeed: 0,
    winddirection: 0,
    isDay: 0,
    weathercode: 0,
  );
  bool isLoading = true;

  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  WeatherService weatherService = WeatherService();

  loadWeatherData() async {
    setState(() {
      isLoading = true;
    });

    _latitude = double.parse(latitudeController.text);

    _longitude = double.parse(longitudeController.text);

    await Future.delayed(Duration(seconds: 1));
    _weatherData = await weatherService.fetchWeather(_longitude, _latitude);

    if (_weatherData.currentWeather != null) {
      _currentWeather = _weatherData.currentWeather!;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    latitudeController.text = _latitude.toString();
    longitudeController.text = _longitude.toString();

    loadWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[300],
        title: const Text('Météo'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ControllerWidget(
              latitudeController: latitudeController,
              longitudeController: longitudeController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange[300],
                ),
                onPressed: () {
                  loadWeatherData();
                },
                child: Text('Recharger'),
              ),
            ),
            SizedBox(
              height: 20.0,
              child: Divider(
                color: Colors.orange,
              ),
            ),
            if (isLoading)
              LoadingWidget()
            else ...{
              Center(child: CurrentWeatherWidget(weatherData: _currentWeather)),
              SizedBox(
                height: 20.0,
                child: Divider(
                  color: Colors.orange,
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemCount: _weatherData.daily!.time!.length,
                    itemBuilder: (BuildContext context, int index) {
                      DayWeather? dayWeather =
                          _weatherData.daily?.getDay(index);
                      if (dayWeather != null) {
                        return DayWeatherWidget(dayWeather: dayWeather);
                      } else {
                        return const Placeholder();
                      }
                    }),
              ),
            }
          ],
        ),
      ),
    );
  }
}
