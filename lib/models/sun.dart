import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sun.g.dart';

@JsonSerializable()
class Sun {
  int sunrise;
  int sunset;
  String country;
  Sun({this.sunrise, this.sunset, this.country});

  // https://flutter.dev/docs/development/data-and-backend/json
  factory Sun.fromJson(Map<String, dynamic> json) => _$SunFromJson(json);
  Map<String, dynamic> toJson() => _$SunToJson(this);

  String get formattedSunrise => DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(sunrise * 1000).toLocal());
  String get formattedSunset => DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(sunset * 1000).toLocal());
}
