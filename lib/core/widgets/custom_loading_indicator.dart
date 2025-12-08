import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
    this.height = 20,
    this.width = 20,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const CircularProgressIndicator(
        color: ColorStyles.primary,
      ),
    );
  }
}
