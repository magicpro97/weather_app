import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable(nullable: true)
class Wind {
  double deg;

  double speed;

  Wind({this.deg, this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}
