import 'package:flutter/material.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/routing/router_configration.dart';
import 'package:marketi/core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Marketi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: RouterConfigration.router,
    );
  }
}
