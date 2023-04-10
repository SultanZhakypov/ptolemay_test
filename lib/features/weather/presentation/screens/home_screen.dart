import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/counter/cubit/counter_cubit.dart';
import 'package:test_project/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:test_project/widgets/buttons.dart';

class TestProject extends StatelessWidget {
  const TestProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) {
                if (state is WeatherLoading) {
                  return const CircularProgressIndicator.adaptive();
                }
                if (state is WeatherError) {
                  return Text(state.error);
                }
                if (state is WeatherSuccess) {
                  return Text(
                      '${state.model.name} - ${state.model.main.temp}C');
                }

                return const Text('Please the icon to get your location');
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(state.counter.toString());
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ButtonsWidget(),
            CounterButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
