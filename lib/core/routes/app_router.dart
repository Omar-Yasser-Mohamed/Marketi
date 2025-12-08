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
import 'package:marketi/features/home/presentation/cubits/all_brands_cubit/all_brands_cubit.dart';
import 'package:marketi/features/home/presentation/cubits/all_categories_cubit/all_categories_cubit.dart';
import 'package:marketi/features/home/presentation/cubits/best_products_cubit/best_products_cubit.dart';
import 'package:marketi/features/home/presentation/cubits/popular_products_cubit/popular_products_cubit.dart';
import 'package:marketi/features/home/presentation/screens/all_brands_screen.dart';
import 'package:marketi/features/home/presentation/screens/all_categories_screen.dart';
import 'package:marketi/features/home/presentation/screens/all_products_screen.dart';
import 'package:marketi/features/home/presentation/screens/best_products_screen.dart';
import 'package:marketi/features/home/presentation/screens/home_root_screen.dart';
import 'package:marketi/features/home/presentation/screens/home_screen.dart';
import 'package:marketi/features/home/presentation/screens/popular_products_screen.dart';
import 'package:marketi/features/search/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:marketi/features/search/presentation/screens/search_screen.dart';
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
      GoRoute(
        path: Routes.homeRootScreen,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              // BlocProvider(
              //   create: (context) => getIt<AllProductCubit>()..getAllProducts(),
              // ),
              BlocProvider(
                create: (context) =>
                    getIt<BestProductsCubit>()..getBestProducts(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<PopularProductsCubit>()..getPopularProducts(),
              ),
              BlocProvider(
                create: (context) =>
                    getIt<AllCategoriesCubit>()..getAllCategories(),
              ),
              BlocProvider(
                create: (context) => getIt<AllBrandsCubit>()..getAllBrands(),
              ),
            ],
            child: const HomeRootScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: Routes.allProductsScreen,
        builder: (context, state) {
          return const AllProductsScreen();
        },
      ),
      GoRoute(
        path: Routes.popularProductsScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                getIt<PopularProductsCubit>()..getPopularProducts(),
            child: const PopularProductsScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.bestProductsScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<BestProductsCubit>()..getBestProducts(),
            child: const BestProductsScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.allCategoriesScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                getIt<AllCategoriesCubit>()..getAllCategories(),
            child: const AllCategoriesScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.allBrandsScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<AllBrandsCubit>()..getAllBrands(),
            child: const AllBrandsScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.searchScreen,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getIt<SearchCubit>()..init(),
            child: const SearchScreen(),
          );
        },
      ),
    ],
  );
}
