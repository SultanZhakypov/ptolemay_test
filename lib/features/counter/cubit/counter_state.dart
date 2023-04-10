part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int counter;
  final bool isDarkTheme;
  const CounterState({
    required this.counter,
    required this.isDarkTheme,
  });
  int get doublestep => isDarkTheme ? 2 : 1;
}

class CounterInitial extends CounterState {
  @override
  final int counter;
  @override
  final bool isDarkTheme;
  const CounterInitial({required this.counter, required this.isDarkTheme})
      : super(counter: counter, isDarkTheme: isDarkTheme);
  @override
  List<Object?> get props => [counter];
}
