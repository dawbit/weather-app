// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sun.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sun _$SunFromJson(Map<String, dynamic> json) {
  return Sun(
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
  );
}

Map<String, dynamic> _$SunToJson(Sun instance) => <String, dynamic>{
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
