part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final ThemeMode mode;
  const ThemeState({required this.mode});
}

class ThemeInitial extends ThemeState {
  @override
  final ThemeMode mode;
  const ThemeInitial({
    required this.mode,
  }) : super(mode: mode);
  @override
  List<Object?> get props => [mode];
}

class ThemeChanged extends ThemeState {
  @override
  final ThemeMode mode;
  const ThemeChanged({
    required this.mode,
  }) : super(mode: mode);
  @override
  List<Object?> get props => [mode];
}
