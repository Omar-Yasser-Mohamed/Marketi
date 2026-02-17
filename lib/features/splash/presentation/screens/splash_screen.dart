import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/shared/token/token_service.dart';
import 'package:marketi/core/styles/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _implementAnimation();
    _implementNavigation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _implementAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  void _implementNavigation() {
    Future.delayed(const Duration(seconds: 3), () async {
      final token = await getIt<TokenService>().getToken();
      if (token == null || token.isEmpty) {
        context.go(AppRoutes.onboarding);
      }
      context.go(AppRoutes.homrScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: Opacity(
                opacity: _animation.value,
                child: Hero(
                  tag: 'splash',
                  child: Image.asset(
                    AppImages.splashLogo,

                    color: context.isLightMode
                        ? AppColors.primary
                        : Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
