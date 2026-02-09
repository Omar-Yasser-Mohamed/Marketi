import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';

abstract class AppTextStyles {
  static const _color = AppColors.darkBlue900;
  // --- Style Normal (Base) ---
  static final normalTextStyle = TextStyle(
    fontSize: 14.fs,
    color: _color,
  );

  // --- Arabic Medium (w500, height: 1.20) ---
  static final arM12 = TextStyle(
    fontSize: 12.fs,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: _color,
  );

  static final arM14 = TextStyle(
    fontSize: 14.fs,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: _color,
  );

  static final arM16 = TextStyle(
    fontSize: 16.fs,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: _color,
  );

  static final arM18 = TextStyle(
    fontSize: 18.fs,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: _color,
  );

  static final arM20 = TextStyle(
    fontSize: 20.fs,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: _color,
  );

  static final arM22 = TextStyle(
    fontSize: 22.fs,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: _color,
  );

  static final arM24 = TextStyle(
    fontSize: 24.fs,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: _color,
  );

  static final arM28 = TextStyle(
    fontSize: 28.fs,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: _color,
  );

  static final arM32 = TextStyle(
    fontSize: 32.fs,
    fontWeight: FontWeight.w500,
    height: 1.20,
    color: _color,
  );

  // --- English Medium (w500, height: 1.36) ---
  static final enM12 = TextStyle(
    fontSize: 12.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  static final enM14 = TextStyle(
    fontSize: 14.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  static final enM16 = TextStyle(
    fontSize: 16.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  static final enM18 = TextStyle(
    fontSize: 18.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  static final enM20 = TextStyle(
    fontSize: 20.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  static final enM22 = TextStyle(
    fontSize: 22.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  static final enM24 = TextStyle(
    fontSize: 24.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  static final enM26 = TextStyle(
    fontSize: 26.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  static final enM28 = TextStyle(
    fontSize: 28.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  static final enM32 = TextStyle(
    fontSize: 32.fs,
    fontWeight: FontWeight.w500,
    height: 1.36,
    color: _color,
  );

  // --- English Semi-Bold (w600, height: Auto) ---
  static final enSb10 = TextStyle(
    fontSize: 10.fs,
    fontWeight: FontWeight.w600,
    color: _color,
  );

  static final enSb14 = TextStyle(
    fontSize: 14.fs,
    fontWeight: FontWeight.w600,
    color: _color,
  );

  static final enSb16 = TextStyle(
    fontSize: 16.fs,
    fontWeight: FontWeight.w600,
    color: _color,
  );

  static final enSb18 = TextStyle(
    fontSize: 18.fs,
    fontWeight: FontWeight.w600,
    color: _color,
  );

  static final enSb20 = TextStyle(
    fontSize: 20.fs,
    fontWeight: FontWeight.w600,
    color: _color,
  );

  static final enSb22 = TextStyle(
    fontSize: 22.fs,
    fontWeight: FontWeight.w600,
    color: _color,
  );

  static final enSb24 = TextStyle(
    fontSize: 24.fs,
    fontWeight: FontWeight.w600,
    color: _color,
  );

  // --- English Regular (w400) ---
  static final enR12 = TextStyle(
    fontSize: 12.fs,
    color: _color,
  );

  static final enR16 = TextStyle(
    fontSize: 16.fs,
    fontWeight: FontWeight.w400,
    color: _color,
  );

  static final enR18 = TextStyle(
    fontSize: 18.fs,
    fontWeight: FontWeight.w400,
    color: _color,
  );

  static final enR12U = TextStyle(
    fontSize: 12.fs,
    fontWeight: FontWeight.w400,
    height: 1.36,
    decoration: TextDecoration.underline,
    color: _color,
  );
}