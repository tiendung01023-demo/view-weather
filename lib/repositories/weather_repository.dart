import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/models/weather_model.dart';

class WeatherRepository {
  static const _weatherAPIKey = 'ff9d7cd147864aa8848115445231310';

  Future<WeatherModel> getCurrentWeather({
    required String query,
  }) async {
    final response = await Dio().get(
      'http://api.weatherapi.com/v1/current.json',
      queryParameters: {
        'key': _weatherAPIKey,
        'q': query,
      },
    );
    final result = WeatherModel.fromJson(response.data);
    debugPrint('[WeatherRepository][getCurrentWeather] ${jsonEncode(response.data)}');
    return result;
  }
}
