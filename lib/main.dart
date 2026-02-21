import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/helpers/hive_helper.dart';
import 'package:marketi/core/localization/generated/app_localizations.dart';
import 'package:marketi/core/responsive/responsive_config.dart';
import 'package:marketi/core/routing/router_configration.dart';
import 'package:marketi/core/theme/app_theme.dart';
import 'package:marketi/features/home/presentation/cubits/home_cubit/home_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  HiveHelper.init();

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
      ],
      child: MaterialApp.router(
        title: 'Marketi',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: RouterConfigration.router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
