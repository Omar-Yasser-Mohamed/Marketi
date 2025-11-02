import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';

class CustomSelectedEllipse extends StatelessWidget {
  const CustomSelectedEllipse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: ColorStyles.darkBlue900,
      ),
    );
  }
}
