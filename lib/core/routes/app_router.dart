import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/verify_otp_cubit/verify_otp_cubit.dart';
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
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: Routes.forgetPasswrod,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPasswordScreen(),
        ),
      ),
      GoRoute(
        path: Routes.verifyScreen,
        builder: (context, state) {
          final email = state.extra as String;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<VerifyOtpCubit>()..email = email,
              ),
              BlocProvider(
                create: (context) => getIt<ForgetPasswordCubit>(),
              ),
            ],
            child: const VerifyCodeScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.changePassword,
        builder: (context, state) {
          final email = state.extra as String;
          return BlocProvider(
            create: (context) => getIt<ResetPasswordCubit>()..email = email,
            child: const ChangePasswordScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.congratsUpdatedPass,
        builder: (context, state) => const FinishUpdatedPassScreen(),
      ),
    ],
  );
}
