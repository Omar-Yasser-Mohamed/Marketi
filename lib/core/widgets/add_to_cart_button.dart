import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    this.height,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
  });
  final double? height;
  final void Function() onPressed;
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: AppColors.darkBlue100,
        ),
        minimumSize: Size(double.infinity, height ?? 28.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(14.r),
        ),
      ),
      onPressed: isLoading ? () {} : onPressed,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: isLoading
            ? const SizedBox(
                key: ValueKey('loading'),
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.primary,
                ),
              )
            : child,
      ),
    );
  }
}
