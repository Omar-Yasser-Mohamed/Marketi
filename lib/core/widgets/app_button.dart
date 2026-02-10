import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.width,
    this.height,
    this.isLoading = false,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.radius,
  });

  final double? width;
  final double? height;
  final bool isLoading;
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final double normalWidth = width ?? double.infinity;
    final double loadingWidth = 100;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height ?? 48.h,
      width: isLoading ? loadingWidth : normalWidth,
      curve: Curves.easeInOut,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 14),
          ),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return ScaleTransition(
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          child: isLoading
              ? const SizedBox(
                  key: ValueKey('loading'),
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  key: const ValueKey('text'),
                  style:
                      textStyle ??
                      AppTextStyles.enM18.copyWith(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
