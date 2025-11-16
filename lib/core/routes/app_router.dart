import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/auth/presentation/screens/change_password_screen.dart';
import 'package:marketi/features/auth/presentation/screens/finish_updated_pass_screen.dart';
import 'package:marketi/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:marketi/features/auth/presentation/screens/login_screen.dart';
import 'package:marketi/features/auth/presentation/screens/register_screen.dart';
import 'package:marketi/features/auth/presentation/screens/verify_code_screen.dart';
import 'package:marketi/features/splash/presentation/screens/onboarding_screen.dart';
import 'package:marketi/features/splash/presentation/screens/splash_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.onBoarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: Routes.forgetPasswrod,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: Routes.verifyScreen,
        builder: (context, state) => const VerifyCodeScreen(),
      ),
      GoRoute(
        path: Routes.changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: Routes.congratsUpdatedPass,
        builder: (context, state) => const FinishUpdatedPassScreen(),
      ),
    ],
  );
}
