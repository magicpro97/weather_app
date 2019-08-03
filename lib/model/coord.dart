import 'package:json_annotation/json_annotation.dart';

part 'coord.g.dart';

@JsonSerializable(nullable: true)
class Coord {
  double lon;

  double lat;

  Coord({this.lat, this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);
}
