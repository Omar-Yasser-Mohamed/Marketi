import 'package:flutter/material.dart';
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
import 'package:marketi/features/home/presentation/cubits/brands_cubit/brands_cubit.dart';
import 'package:marketi/features/home/presentation/screens/brands_screen.dart';
import 'package:marketi/features/home/presentation/screens/categories_screen.dart';
import 'package:marketi/features/home/presentation/screens/home_screen.dart';
import 'package:marketi/features/home/presentation/screens/main_navigation_screen.dart';
import 'package:marketi/features/home/presentation/screens/product_details_screen.dart';
import 'package:marketi/features/home/presentation/screens/products_screen.dart';
import 'package:marketi/features/profile/presentation/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:marketi/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:marketi/features/profile/presentation/screens/locale_screen.dart';
import 'package:marketi/features/profile/presentation/screens/profile_screen.dart';
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
      //Nav bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainNavigationScreen(navigationShell: navigationShell);
        },
        branches: [
          //Home screen
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.homeScreen,
                builder: (context, state) {
                  return const HomeScreen();
                },
              ),
            ],
          ),

          //Cart screen
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.cartScreen,
                builder: (context, state) {
                  return const Scaffold(
                    body: Center(
                      child: Text("Cart"),
                    ),
                  );
                },
              ),
            ],
          ),

          //Fav screen
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.favoritesScreen,
                builder: (context, state) {
                  return const Scaffold(
                    body: Center(
                      child: Text("Fav"),
                    ),
                  );
                },
              ),
            ],
          ),

          //Profile screen
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profileScreen,
                builder: (context, state) {
                  return const ProfileScreen();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.productDetailsScreen,
        builder: (context, state) => const ProductDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.productsScreen,
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: AppRoutes.categoriesScreen,
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: AppRoutes.brandsScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<BrandsCubit>()..getBrands(),
          child: const BrandsScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.editProfileScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<UpdateProfileCubit>(),
          child: const EditProfileScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.localeScreen,
        builder: (context, state) => const LocaleScreen(),
      ),
    ],
  );
}
