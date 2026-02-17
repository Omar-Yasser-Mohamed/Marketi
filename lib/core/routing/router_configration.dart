import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/verify_otp_cubit/otp_timer_cubit.dart';
import 'package:marketi/features/auth/presentation/cubits/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:marketi/features/auth/presentation/screens/congratulations_screen.dart';
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
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<SignupCubit>(),
          child: const SignUpScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPasswordScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.verificationCode,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<VerifyOtpCubit>(),
            ),
            BlocProvider(
              create: (context) => getIt<OtpTimerCubit>()..start(),
            ),
            BlocProvider(
              create: (context) => getIt<ForgetPasswordCubit>(),
            ),
          ],
          child: const VerificationScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.resetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ResetPasswordCubit>(),
          child: const ResetPasswordScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.congratulationsScreen,
        builder: (context, state) => const CongratulationsScreen(),
      ),
    ],
  );
}
