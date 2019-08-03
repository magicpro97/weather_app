import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/place_info.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final PlaceInfo placeInfo;

  WeatherLoaded({this.placeInfo}) : super([placeInfo]);
}

class WeatherLoadedFail extends WeatherState {}

class NoConnection extends WeatherState {}
