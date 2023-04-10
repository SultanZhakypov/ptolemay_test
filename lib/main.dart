import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/counter/cubit/counter_cubit.dart';
import 'package:test_project/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:test_project/features/weather/presentation/screens/home_screen.dart';
import 'package:test_project/service_locator.dart' as di;
import 'package:test_project/service_locator.dart';

void main() async {
  runApp(const MyApp());
  await di.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CounterCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ThemeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<WeatherCubit>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            themeMode: state.mode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            title: 'Material App',
            home: const TestProject(),
          );
        },
      ),
    );
  }
}
