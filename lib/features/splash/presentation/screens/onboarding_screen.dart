import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_one.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_three.dart';
import 'package:marketi/features/splash/presentation/widgets/onboarding_two.dart';
import 'package:marketi/features/splash/presentation/widgets/pages_indecator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Pages
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            children: const [
              OnboardingOne(),
              OnboardingTwo(),
              OnboardingThree(),
            ],
          ),

          // Page Indicator
          Positioned(
            bottom: 140,
            left: 0,
            right: 0,
            child: PagesIndecator(currentPage: _currentPage),
          ),

          // button
          Positioned(
            bottom: 48,
            left: 14.p,
            right: 14.p,
            child: AppButton(
              text: _currentPage == 2
                  ? context.l10n.getStarted
                  : context.l10n.next,
              onPressed: () {
                setState(() {
                  if (_currentPage < 2) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    context.go(AppRoutes.login);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
