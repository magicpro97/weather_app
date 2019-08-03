import 'package:json_annotation/json_annotation.dart';

part 'sys.g.dart';

@JsonSerializable(nullable: true)
class Sys {
  String country;

  double sunrise;

  double sunset;

  int id;

  int type;

  double message;

  Sys(
      {this.country,
      this.id,
      this.message,
      this.sunrise,
      this.sunset,
      this.type});

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
}
