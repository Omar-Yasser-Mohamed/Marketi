import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    this.height,
    required this.onPressed,
    required this.child,
  });
  final double? height;
  final void Function() onPressed;
  final Widget child;

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
      onPressed: onPressed,
      child: child,
    );
  }
}
