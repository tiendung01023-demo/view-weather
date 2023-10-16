import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/pages/view_weather/view_weather_state.dart';
import 'package:flutterapp/repositories/weather_repository.dart';

class ViewWeatherBloc extends Cubit<ViewWeatherState> {
  ViewWeatherBloc(String query) : super(const ViewWeatherState()) {
    _getWeatherInfo(query: query);
  }

  final WeatherRepository _weatherRepository = WeatherRepository();

  Future<void> _getWeatherInfo({required String query}) async {
    emit(state.copyWith(isLoading: true, isError: false));
    try {
      final result = await _weatherRepository.getCurrentWeather(query: query);
      emit(state.copyWith(data: result, isLoading: false));
    } catch (e, stack) {
      debugPrint('[ViewWeatherBloc][_getWeatherInfo] $e $stack');
      emit(state.copyWith(isError: true, isLoading: false));
    }
  }
}
