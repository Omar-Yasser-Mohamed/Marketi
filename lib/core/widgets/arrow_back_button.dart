import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/constansts/app_icons.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: Container(
        padding: EdgeInsets.only(
          top: 10.h,
          bottom: 10.h,
          left: 14.w,
          right: 16.w,
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
            width: context.screenHeight * 0.013,
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
