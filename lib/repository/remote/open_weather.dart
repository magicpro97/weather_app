import 'dart:convert';

import 'package:weather_app/model/place_info.dart';
//import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class OpenWeatherRepository {
  static final String url =
      'http://api.openweathermap.org/data/2.5/weather?APPID=89bf60feb4a279a8e5ce1d5e091388e6';

  Future<PlaceInfo> fetchWeatherData(String cityName) async {
    final response = await http.get('$url&q=$cityName');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      return PlaceInfo.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}
