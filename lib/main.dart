import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/helpers/hive_helper.dart';
import 'package:marketi/core/localization/generated/app_localizations.dart';
import 'package:marketi/core/responsive/responsive_config.dart';
import 'package:marketi/core/routing/router_configration.dart';
import 'package:marketi/core/theme/app_theme.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/favorites/presentation/cubits/fav_cubit/fav_cubit.dart';
import 'package:marketi/features/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:marketi/features/profile/presentation/cubits/locale_cubit/locale_cubit.dart';
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/cubits/theme_cubit/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveHelper.init();
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // init responsive config
    ResponsiveConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>()..loadHomeData(),
        ),
        BlocProvider(
          create: (context) => getIt<CartCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<FavCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<LocaleCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<ThemeCubit>(),
        ),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              final isDark = state.mode == AppThemeMode.dark;
              return MaterialApp.router(
                locale: locale,
                title: 'Marketi',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                routerConfig: RouterConfigration.router,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
                builder: (context, child) {
                  return AnimatedTheme(
                    data: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: child!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
