// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainWeather _$MainWeatherFromJson(Map<String, dynamic> json) {
  return MainWeather(
    feelsLike: (json['feels_like'] as num)?.toDouble(),
    pressure: (json['pressure'] as num)?.toDouble(),
    temperature: (json['temp'] as num)?.toDouble(),
    tempMax: (json['temp_max'] as num)?.toDouble(),
    tempMin: (json['temp_min'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MainWeatherToJson(MainWeather instance) =>
    <String, dynamic>{
      'temp': instance.temperature,
      'feels_like': instance.feelsLike,
      'temp_min': instance.tempMin,
      'temp_max': instance.tempMax,
      'pressure': instance.pressure,
    };
