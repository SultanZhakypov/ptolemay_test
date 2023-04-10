part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel model;

  WeatherSuccess(this.model);
}

class WeatherError extends WeatherState {
  final String error;

  WeatherError(this.error);
}
