// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceInfo _$PlaceInfoFromJson(Map<String, dynamic> json) {
  return PlaceInfo(
    id: json['id'] as int,
    base: json['base'] as String,
    clouds: json['clouds'] == null
        ? null
        : Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    cod: json['cod'] as int,
    coord: json['coord'] == null
        ? null
        : Coord.fromJson(json['coord'] as Map<String, dynamic>),
    dt: json['dt'] as int,
    main: json['main'] == null
        ? null
        : Main.fromJson(json['main'] as Map<String, dynamic>),
    name: json['name'] as String,
    sys: json['sys'] == null
        ? null
        : Sys.fromJson(json['sys'] as Map<String, dynamic>),
    timezone: json['timezone'] as int,
    visibility: json['visibility'] as int,
    wind: json['wind'] == null
        ? null
        : Wind.fromJson(json['wind'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlaceInfoToJson(PlaceInfo instance) => <String, dynamic>{
      'visibility': instance.visibility,
      'timezone': instance.timezone,
      'main': instance.main,
      'clouds': instance.clouds,
      'sys': instance.sys,
      'dt': instance.dt,
      'coord': instance.coord,
      'name': instance.name,
      'cod': instance.cod,
      'id': instance.id,
      'base': instance.base,
      'wind': instance.wind,
    };
