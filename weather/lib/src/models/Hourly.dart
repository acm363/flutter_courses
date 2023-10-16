class Hourly {
  List<String>? time;
  List<double>? temperature2m;
  List<int>? weathercode;

  Hourly({this.time, this.temperature2m, this.weathercode});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].cast<double>();
    weathercode = json['weathercode'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['weathercode'] = weathercode;
    return data;
  }
}