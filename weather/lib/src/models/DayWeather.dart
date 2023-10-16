class DayWeather {
  String? time;

  int? weathercode;

  double? temperature2mMax;

  double? temperature2mMin;

  String? sunrise;

  String? sunset;

  DayWeather({
    this.time,
    this.weathercode,
    this.temperature2mMax = 0,
    this.temperature2mMin = 0,
    this.sunrise = '',
    this.sunset = '',
  });
}
