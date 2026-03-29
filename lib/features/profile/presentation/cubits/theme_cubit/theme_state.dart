part of 'theme_cubit.dart';

enum AppThemeMode { light, dark }

class ThemeState {
  final AppThemeMode mode;
  ThemeState({this.mode = AppThemeMode.light});

  ThemeState copyWith({AppThemeMode? mode}) {
    return ThemeState(mode: mode ?? this.mode);
  }
}
