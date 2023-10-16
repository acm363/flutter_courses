import 'package:dio/dio.dart';
import 'package:weather/src/models/DayWeather.dart';
import 'package:weather/src/models/WeatherData.dart';

class WeatherService {
  late WeatherData weatherData;

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.open-meteo.com/',
    queryParameters: {
      'timezone': 'Europe/Berlin',
    },
  ));

  // Fetch the weather Data.
  Future<WeatherData> fetchWeather(double longitude, double latitude) async {
    final response = await dio.get('/v1/forecast', queryParameters: {
      'latitude': latitude,
      'longitude': longitude,
      'daily': [
        'weathercode',
        'temperature_2m_max',
        'temperature_2m_min',
        'sunrise',
        'sunset'
      ],
      'current_weather': true,
    });

    if (response.statusCode == 200) {
      weatherData = WeatherData.fromJson(response.data);
      print(
          'Response: ${weatherData.latitude} , ${weatherData.longitude}, ${weatherData.currentWeather?.temperature}');
      return weatherData;
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // Parse weather day.
  DayWeather getDay(WeatherData weatherData, int index) {
    return weatherData.daily!.getDay(index);
  }
}
