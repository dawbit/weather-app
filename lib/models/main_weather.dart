import 'package:json_annotation/json_annotation.dart';

part 'main_weather.g.dart';

@JsonSerializable()
class MainWeather {
  @JsonKey(name: 'temp')
  double temperature;
  @JsonKey(name: 'feels_like')
  double feelsLike;
  @JsonKey(name: 'temp_min')
  double tempMin;
  @JsonKey(name: 'temp_max')
  double tempMax;
  @JsonKey(name: 'pressure')
  double pressure;
  MainWeather({this.feelsLike, this.pressure, this.temperature, this.tempMax, this.tempMin});
  factory MainWeather.fromJson(Map<String, dynamic> json) => _$MainWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$MainWeatherToJson(this);
}
