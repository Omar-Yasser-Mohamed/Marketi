import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_widgets/custom_onboarding.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomOnboarding(
      title: 'Easy to Buy',
      description:
          'Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.',
      image: AppImages.onBoardingTwo,
      nextRoute: Routes.onBoardingThree,
      page: 2,
    );
  }
}
