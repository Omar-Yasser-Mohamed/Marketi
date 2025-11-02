import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/splash/presentation/screens/onboarding_screen_one.dart';
import 'package:marketi/features/splash/presentation/screens/onboarding_screen_three.dart';
import 'package:marketi/features/splash/presentation/screens/onboarding_screen_two.dart';
import 'package:marketi/features/splash/presentation/screens/splash_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.onBoardingOne,
        builder: (context, state) => const OnboardingScreenOne(),
      ),
      GoRoute(
        path: Routes.onBoardingTwo,
        builder: (context, state) => const OnboardingScreenTwo(),
      ),
      GoRoute(
        path: Routes.onBoardingThree,
        builder: (context, state) => const OnboardingScreenThree(),
      ),
    ],
  );
}
