import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';

class ResponsiveConfig {
  static const double _designWidth = 375;
  static const double _designHeight = 812;

  static late double screenWidth;
  static late double screenHeight;

  static late double scaleWidth;
  static late double scaleHeight;
  static late double scaleText;
  static late double scaleIcon;

  static void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    screenWidth = context.isPortrait ? size.width : size.height;
    screenHeight = context.isPortrait ? size.height : size.width;

    scaleWidth = screenWidth / _designWidth;
    scaleHeight = screenHeight / _designHeight;

    // font scaling controlled
    scaleText = scaleWidth.clamp(0.8, 1.3);
    scaleIcon = scaleWidth.clamp(0.8, 1.3);
  }

  // Responsive Width
  static double width(double value) => value * scaleWidth;

  // Responsive Height
  static double height(double value) => value * scaleHeight;

  // Responsive Font Size
  static double fontSize(double value) => value * scaleText;

  // Responsive Icon
  static double icon(double value) => value * scaleIcon;

  // Responsive Radius
  static double radius(double value) => value * scaleWidth;

  // Responsive padding
  static double padding(double value) => value * scaleWidth;

  // Responsive Margin
  static double margin(double value) => value * scaleWidth;
}
