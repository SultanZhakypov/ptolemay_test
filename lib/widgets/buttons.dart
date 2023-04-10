import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/counter/cubit/counter_cubit.dart';
import 'package:test_project/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:test_project/widgets/animated_button.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => context.read<WeatherCubit>().getWeather(),
          heroTag: 'cloud',
          child: const Icon(Icons.cloud),
        ),
        const SizedBox(height: 20),
        BlocConsumer<ThemeCubit, ThemeState>(
          listener: (context, state) {
            if (state is ThemeChanged) {
              context
                  .read<CounterCubit>()
                  .setStep(state.mode == ThemeMode.dark);
            }
          },
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () => context.read<ThemeCubit>().changeTheme(
                    state.mode == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light,
                  ),
              heroTag: 'theme',
              child: const Icon(Icons.palette),
            );
          },
        ),
      ],
    );
  }
}

class CounterButtonsWidget extends StatelessWidget {
  const CounterButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedButton(
              isVisible: state.counter == 10,
              child: FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().increment(),
                heroTag: 'add',
                child: const Icon(Icons.add),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedButton(
              isVisible: state.counter == 0,
              child: FloatingActionButton(
                onPressed: () => context.read<CounterCubit>().decrement(),
                heroTag: 'remove',
                child: const Icon(Icons.remove),
              ),
            ),
          ],
        );
      },
    );
  }
}
