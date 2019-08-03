import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(nullable: true)
class Weather {
  String icon;

  String description;

  String main;

  String id;

  Weather({this.id, this.description, this.icon, this.main});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
