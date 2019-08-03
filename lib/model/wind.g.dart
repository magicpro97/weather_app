// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    deg: (json['deg'] as num)?.toDouble(),
    speed: (json['speed'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'deg': instance.deg,
      'speed': instance.speed,
    };
