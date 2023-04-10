import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial(counter: 0, isDarkTheme: false));

  void setStep(bool changetheme) {
    if (state.isDarkTheme != changetheme) {
      emit(CounterInitial(counter: state.counter, isDarkTheme: changetheme));
    }
  }

  void increment() {
    emit(CounterInitial(
        isDarkTheme: state.isDarkTheme,
        counter: min(state.counter + state.doublestep, 10)));
  }

  void decrement() => emit(CounterInitial(
      isDarkTheme: state.isDarkTheme,
      counter: max(state.counter - state.doublestep, 0)));
}
