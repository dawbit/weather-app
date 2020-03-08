// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sun: json['sys'] == null
        ? null
        : Sun.fromJson(json['sys'] as Map<String, dynamic>),
    main: json['main'] == null
        ? null
        : MainWeather.fromJson(json['main'] as Map<String, dynamic>),
  )..name = json['name'] as String;
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'main': instance.main,
      'sys': instance.sun,
      'name': instance.name,
    };
