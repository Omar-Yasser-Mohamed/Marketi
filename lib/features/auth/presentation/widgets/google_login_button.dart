import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constansts/app_icons.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.p),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.isLightMode
              ? const Color(0xFFB2CCFF).withValues(alpha: 0.7)
              : AppColors.lightBlue900,
        ),
      ),
      child: SvgPicture.asset(
        AppIcons.google,
        colorFilter: ColorFilter.mode(
          context.isLightMode ? AppColors.darkBlue900 : AppColors.lightBlue900,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
