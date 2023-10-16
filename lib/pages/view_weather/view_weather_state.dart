import 'package:equatable/equatable.dart';
import 'package:flutterapp/models/weather_model.dart';

class ViewWeatherState extends Equatable {
  const ViewWeatherState({
    this.isError = false,
    this.isLoading = false,
    this.data,
  });

  final bool isError;
  final bool isLoading;
  final WeatherModel? data;

  ViewWeatherState copyWith({
    bool? isError,
    bool? isLoading,
    WeatherModel? data,
  }) {
    return ViewWeatherState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        isError,
        isLoading,
        data,
      ];
}
