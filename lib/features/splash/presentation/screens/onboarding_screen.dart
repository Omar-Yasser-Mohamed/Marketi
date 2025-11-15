import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_widgets/onboarding_screen_one.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_widgets/onboarding_screen_three.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_widgets/onboarding_screen_two.dart';
import 'package:marketi/core/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: const [
                OnboardingScreenOne(),
                OnboardingScreenTwo(),
                OnboardingScreenThree(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: CustomButton(
              onPressed: () {
                _navigationBetweenPages(context);
              },
              text: currentPage == 2 ? 'Get Started' : 'Next',
            ),
          ),

          const SizedBox(height: 48),
        ],
      ),
    );
  }

  void _navigationBetweenPages(BuildContext context) {
    if (currentPage < 2) {
      setState(() {
        currentPage++;
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      });
    } else {
      GoRouter.of(context).push(Routes.login);
    }
  }
}
