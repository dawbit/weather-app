import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()
class Wind {
  double speed;
  Wind({this.speed});

  // https://flutter.dev/docs/development/data-and-backend/json
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}
