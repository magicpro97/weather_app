// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sys _$SysFromJson(Map<String, dynamic> json) {
  return Sys(
    country: json['country'] as String,
    id: json['id'] as int,
    message: (json['message'] as num)?.toDouble(),
    sunrise: (json['sunrise'] as num)?.toDouble(),
    sunset: (json['sunset'] as num)?.toDouble(),
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'id': instance.id,
      'type': instance.type,
      'message': instance.message,
    };
