import 'package:flutter/material.dart';
import 'package:marketi/core/localization/generated/app_localizations.dart';
import 'package:marketi/core/styles/app_colors.dart';

extension ContextExtention on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;

  AppLocalizations get l10n => AppLocalizations.of(this)!;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  Color get textColor => isLightMode ? AppColors.darkBlue900 : Colors.white;
  Color get logoColor => isLightMode ? AppColors.primary : Colors.white;
  Color get backgroundColor => isLightMode ? Colors.white : AppColors.primaryDark;

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
}
