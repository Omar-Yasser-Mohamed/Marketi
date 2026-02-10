import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/core/constansts/app_icons.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.only(
          top: 14.h,
          bottom: 14.h,
          left: 18.w,
          right: 20.w,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.lightBlue700.withValues(alpha: 0.7),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIcons.arrowBackIos,
            width: context.screenHeight * 0.015,
            colorFilter: ColorFilter.mode(
              context.isLightMode
                  ? AppColors.darkBlue900
                  : AppColors.lightBlue900,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
