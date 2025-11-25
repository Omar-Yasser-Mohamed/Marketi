import 'package:flutter/widgets.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentBottomNavBarItem customNavItem({
  IconData? icon,
  required String title,
}) {
  return PersistentBottomNavBarItem(
    icon: Icon(icon),
    title: title,
    activeColorPrimary: ColorStyles.primary,
    inactiveColorPrimary: const Color(0xFF67687E),
  );
}
