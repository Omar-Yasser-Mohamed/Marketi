import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_widgets/custom_onboarding.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomOnboarding(
      title: 'Welcom to Marketi',
      description:
          'Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.',
      image: AppImages.onBoardingOne,
      nextRoute: Routes.onBoardingTwo,
      page: 1,
    );
  }
}
