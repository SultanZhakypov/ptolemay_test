import 'package:dio/dio.dart';
import 'package:test_project/features/weather/models/weather_model.dart';

abstract class WeatherRepo {
  Future<WeatherModel> getWeather(double lat, double lon);
}

class WeatherRepoImpl implements WeatherRepo {
  final Dio _dio;

  WeatherRepoImpl(this._dio);
  @override
  Future<WeatherModel> getWeather(double lat, double lon) async {
    try {
      final response = await _dio.get(
          'data/2.5/weather?lat=$lat&lon=$lon&appid=2326bb344551950d645e91890bd120ed&units=metric');
      return WeatherModel.fromJson(response.data);
    } on DioError catch (e) {
      throw e.toString();
    }
  }
}
