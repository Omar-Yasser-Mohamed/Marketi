import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/di/injectable.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/token/token_service.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _initBounceAnimation();
    _impelementNavigation();
  }

  void _initBounceAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );

    _animation =
        Tween<Offset>(
          begin: const Offset(0, -3),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.bounceOut,
          ),
        );

    _animationController.forward();
  }

  void _impelementNavigation() async {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        final token = await getIt<TokenService>().getToken();

        if (token != null && token.isNotEmpty) {
          log(token);
          GoRouter.of(context).go(Routes.homeRootScreen);
        } else {
          GoRouter.of(context).go(Routes.onBoarding);
        }
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        builder: (context, _) => SlideTransition(
          position: _animation,
          child: Image.asset(AppImages.logoSplashScreen),
        ),
        animation: _animation,
      ),
    );
  }
}
