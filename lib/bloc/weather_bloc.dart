import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:weather_app/model/place_info.dart';
import 'package:weather_app/repository/remote/open_weather.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final openWeatherRepository = OpenWeatherRepository();

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      final connection = await Connectivity().checkConnectivity();
      if (connection == ConnectivityResult.none) {
        yield NoConnection();
      } else {
        yield WeatherLoading();
        final placeInfo = await _fetchWeatherFromFakeApi(event.cityName);
        if (placeInfo != null) {
          yield WeatherLoaded(placeInfo: placeInfo);
        } else {
          yield WeatherLoadedFail();
        }
      }
    }
  }

  Future<PlaceInfo> _fetchWeatherFromFakeApi(String cityName) {
    return Future.delayed(Duration(seconds: 1), () {
      return openWeatherRepository.fetchWeatherData(cityName);
    });
  }
}
