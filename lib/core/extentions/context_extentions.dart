import 'package:flutter/material.dart';
import 'package:marketi/core/localization/generated/app_localizations.dart';
import 'package:marketi/core/styles/app_colors.dart';

extension ContextExtention on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  Color get primaryColor => isLightMode ? AppColors.darkBlue900 : Colors.white;
  Color get logoColor => isLightMode ? AppColors.primary : Colors.white;
  
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
}
