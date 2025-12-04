import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/routes/app_router.dart';
import 'package:marketi/core/theme/app_theme.dart';
import 'package:marketi/core/utils/app_bloc_observer.dart';

void main() {
  configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const Marketi());
}

class Marketi extends StatelessWidget {
  const Marketi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Marketi',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
