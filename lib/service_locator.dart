import 'package:get_it/get_it.dart';
import 'package:test_project/core/api_client/api_client.dart';
import 'package:test_project/features/counter/cubit/counter_cubit.dart';
import 'package:test_project/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:test_project/features/weather/repositroies/location.dart';
import 'package:test_project/features/weather/repositroies/weather_repo.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => CounterCubit());
  sl.registerFactory(() => ThemeCubit());
  sl.registerFactory(() => WeatherCubit(sl(), sl()));

  sl.registerLazySingleton<LocationRepo>(() => LocationRepoImpl());
  sl.registerLazySingleton<WeatherRepo>(() => WeatherRepoImpl(ApiClient().dio));
}
