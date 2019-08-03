import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/model/cloulds.dart';
import 'package:weather_app/model/coord.dart';
import 'package:weather_app/model/main.dart';
import 'package:weather_app/model/sys.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/model/wind.dart';

part 'place_info.g.dart';

@JsonSerializable(nullable: true)
class PlaceInfo {
  final int visibility;

  final int timezone;

  final Main main;

  final Clouds clouds;

  final Sys sys;

  final int dt;

  final Coord coord;

  List<Weather> weather;

  final String name;

  final int cod;

  final int id;

  final String base;

  final Wind wind;

  PlaceInfo(
      {this.id,
      this.base,
      List<Weather> weather,
      this.clouds,
      this.cod,
      this.coord,
      this.dt,
      this.main,
      this.name,
      this.sys,
      this.timezone,
      this.visibility,
      this.wind})
      : weather = weather ?? List<Weather>();

  factory PlaceInfo.fromJson(Map<String, dynamic> json) =>
      _$PlaceInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceInfoToJson(this);
}
