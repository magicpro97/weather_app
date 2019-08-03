// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    id: json['id'] as String,
    description: json['description'] as String,
    icon: json['icon'] as String,
    main: json['main'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'icon': instance.icon,
      'description': instance.description,
      'main': instance.main,
      'id': instance.id,
    };
