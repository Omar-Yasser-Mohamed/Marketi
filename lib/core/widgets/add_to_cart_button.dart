import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key, this.height, this.onPressed});
  final double? height;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, height ?? 28.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(14.r),
          side: const BorderSide(
            color: AppColors.darkBlue100,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        "Add",
        style: AppTextStyles.enM14.copyWith(
          color: AppColors.darkBlue100,
        ),
      ),
    );
  }
}
