import 'package:go_router/go_router.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/features/splash/presentation/screens/splash_screen.dart';

abstract class RouterConfigration {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
