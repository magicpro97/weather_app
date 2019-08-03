// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main(
    temp: (json['temp'] as num)?.toDouble(),
    tempMin: (json['tempMin'] as num)?.toDouble(),
    tempMax: (json['tempMax'] as num)?.toDouble(),
    humidity: (json['humidity'] as num)?.toDouble(),
    pressure: (json['pressure'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'tempMin': instance.tempMin,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'tempMax': instance.tempMax,
    };
