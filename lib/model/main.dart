import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable(nullable: true)
class Main {
  double temp;

  double tempMin;

  double humidity;

  double pressure;

  double tempMax;

  Main({this.temp, this.tempMin, this.tempMax, this.humidity, this.pressure});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);
}
