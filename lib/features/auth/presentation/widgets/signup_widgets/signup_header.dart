import 'package:flutter/material.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ArrowBackButton(),

        Hero(
          tag: 'logo',
          child: Image.asset(
            AppImages.signupLogo,
            color: context.isLightMode ? AppColors.primary : Colors.white,
          ),
        ),

        SizedBox(width: 50.w),
      ],
    );
  }
}
