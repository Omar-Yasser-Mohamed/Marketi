import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:marketi/features/auth/presentation/screens/login_screen.dart';
import 'package:marketi/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:marketi/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:marketi/features/auth/presentation/screens/verification_screen.dart';
import 'package:marketi/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:marketi/features/splash/presentation/screens/splash_screen.dart';

abstract class RouterConfigration {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.verificationCode,
        builder: (context, state) => const VerificationScreen(),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
    ],
  );
}
