import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  String main;
  String description;
  String icon;
  Weather({this.main, this.description, this.icon});

  //https://flutter.dev/docs/development/data-and-backend/json
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
