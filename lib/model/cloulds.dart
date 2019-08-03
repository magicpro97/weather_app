import 'package:json_annotation/json_annotation.dart';

part 'cloulds.g.dart';

@JsonSerializable(nullable: true)
class Clouds {
  double all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}
