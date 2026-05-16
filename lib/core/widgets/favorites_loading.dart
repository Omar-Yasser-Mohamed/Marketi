import 'package:flutter/widgets.dart';
import 'package:marketi/core/styles/app_colors.dart';

class FavoritesLoading extends StatefulWidget {
  const FavoritesLoading({super.key});

  @override
  State<FavoritesLoading> createState() => _FavoritesLoadingState();
}

class _FavoritesLoadingState extends State<FavoritesLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _animation = Tween<double>(begin: 5, end: 20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final scale = (_animation.value - 5) / 15;
        return Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: scale,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkRed200.withValues(alpha: 0.2),
                ),
              ),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkRed200,
              ),
            ),
          ],
        );
      },
    );
  }
}
