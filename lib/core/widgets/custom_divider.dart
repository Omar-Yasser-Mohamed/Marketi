import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.isLightMode
          ? const Color(0xffDCDDE0)
          : AppColors.customBlack,
      thickness: 1,
      height: 1,
    );
  }
}
