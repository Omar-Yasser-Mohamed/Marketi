import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({
    super.key,
    required this.onPressed,
    this.height = 28,
    this.width = double.infinity,
    required this.child,
    this.radius = 50,
  });

  final double height;
  final double width;
  final void Function() onPressed;
  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 4.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: const BorderSide(
              color: ColorStyles.primary,
            ),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
