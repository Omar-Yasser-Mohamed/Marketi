import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_widgets/custom_button.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_widgets/custom_ellipse.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_widgets/custom_selected_ellipse.dart';

class CustomOnboarding extends StatelessWidget {
  const CustomOnboarding({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.nextRoute,
    this.buttonText = 'Next',
    required this.page,
  });
  final String image;
  final String title;
  final String description;
  final String buttonText;
  final String nextRoute;
  final int page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 164),
          Image.asset(image),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              page == 1 ? const CustomSelectedEllipse() : const CustomEllipse(),
              page == 2 ? const CustomSelectedEllipse() : const CustomEllipse(),
              page == 3 ? const CustomSelectedEllipse() : const CustomEllipse(),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyles.enSb20.copyWith(
              color: ColorStyles.darkBlue900,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyles.enSb14.copyWith(
                  color: ColorStyles.darkBlue900,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: CustomButton(
              onPressed: () {
                GoRouter.of(context).push(nextRoute);
              },
              text: buttonText,
            ),
          ),

          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
