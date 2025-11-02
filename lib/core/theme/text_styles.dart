import 'package:flutter/widgets.dart';

abstract class TextStyles {
  // --- Style Normal (Base) ---
  static const normalTextStyle = TextStyle(
    fontSize: 14,
  );

  // --- Arabic Medium (w500, height: 1.20) ---
  static const arM12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.20,
  );

  static const arM14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.20,
  );

  static const arM16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.20,
  );

  static const arM18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.20,
  );

  static const arM20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.20,
  );

  static const arM22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.20,
  );

  static const arM24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.20,
  );

  static const arM28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.20,
  );

  static const arM32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    height: 1.20,
  );

  // --- English Medium (w500, height: 1.36) ---
  static const enM12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );

  static const enM14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );

  static const enM16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );

  static const enM18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );

  static const enM20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );

  static const enM22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );

  static const enM24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );

  static const enM28 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );

  static const enM32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    height: 1.36,
  );

  // --- English Semi-Bold (w600, height: Auto) ---
  static const enSb10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );

  static const enSb14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const enSb16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const enSb18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const enSb20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  // --- English Regular (w400) ---
  static const enR12 = TextStyle(
    fontSize: 12,
  );

  static const enR16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const enR12U = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.36,
    decoration: TextDecoration.underline,
  );
}