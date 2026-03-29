import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketi/core/constansts/hive_constants.dart';
import 'package:marketi/core/helpers/hive_helper.dart';

part 'theme_state.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState()) {
    _loadTheme();
  }

  void _loadTheme() {
    final theme = HiveHelper.get<String>(
      boxName: HiveConstants.themeBox,
      key: HiveConstants.themeKey,
    );
    if (theme != null) {
      emit(state.copyWith(mode: AppThemeMode.values.byName(theme)));
    }
  }

  Future<void> toggleTheme() async {
    await HiveHelper.put(
      boxName: HiveConstants.themeBox,
      key: HiveConstants.themeKey,
      data: state.mode == AppThemeMode.light ? "dark" : "light",
    );
    emit(
      state.copyWith(
        mode: state.mode == AppThemeMode.light
            ? AppThemeMode.dark
            : AppThemeMode.light,
      ),
    );
  }
}
