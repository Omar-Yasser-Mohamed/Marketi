import 'package:flutter/material.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(height: size.height * 0.2),
        Hero(
          tag: 'onboarding3',
          child: Image.asset(
            AppImages.onboardingThreeImage,
            height: size.height * 0.35,
          ),
        ),

        const SizedBox(height: 8),
        Text(
          context.l10n.onboardingThreeTitle,
          style: AppTextStyles.enSb20,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.p),
          child: Text(
            context.l10n.onboardingThreeDesc,
            textAlign: TextAlign.center,
            style: AppTextStyles.enM14,
          ),
        ),
      ],
    );
  }
}
