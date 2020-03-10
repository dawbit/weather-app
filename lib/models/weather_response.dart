import 'package:weatherapp/models/main_weather.dart';
import 'package:weatherapp/models/sun.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_response.g.dart';

@JsonSerializable()
class WeatherResponse {
  List<Weather> weather;
  MainWeather main;
  @JsonKey(name: 'sys')
  Sun sun;
  String name;
  WeatherResponse({this.weather, this.sun, this.main});

  //https://flutter.dev/docs/development/data-and-backend/json
  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}
