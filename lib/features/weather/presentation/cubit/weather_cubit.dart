import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_project/features/weather/models/weather_model.dart';
import 'package:test_project/features/weather/repositroies/location.dart';
import 'package:test_project/features/weather/repositroies/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final LocationRepo _locationRepo;
  final WeatherRepo _weatherRepo;
  WeatherCubit(this._locationRepo, this._weatherRepo) : super(WeatherInitial());

  Future<void> getWeather() async {
    emit(WeatherLoading());
    try {
      await _locationRepo.determinePosition().then((value) async {
        final getWeather =
            await _weatherRepo.getWeather(value.latitude, value.longitude);
        emit(WeatherSuccess(getWeather));
      });
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
