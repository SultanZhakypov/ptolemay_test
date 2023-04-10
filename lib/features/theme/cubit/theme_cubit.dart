import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial(mode: ThemeMode.light));
  void changeTheme(ThemeMode mode) {
    if (state.mode != mode) {
      emit(ThemeChanged(mode: mode));
    }
  }
}
