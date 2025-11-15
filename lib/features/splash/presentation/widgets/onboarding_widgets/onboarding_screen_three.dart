import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_widgets/custom_onboarding.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomOnboarding(
      title: 'Wonderful User Experience',
      description:
          'Start exploring now and experience the convenience of online shopping at its best.',
      image: AppImages.onBoardingThree,
      page: 3,
    );
  }
}
