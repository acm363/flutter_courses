class HourlyUnits {
  String? time;
  String? temperature2m;
  String? weathercode;

  HourlyUnits({this.time, this.temperature2m, this.weathercode});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    weathercode = json['weathercode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['weathercode'] = weathercode;
    return data;
  }
}