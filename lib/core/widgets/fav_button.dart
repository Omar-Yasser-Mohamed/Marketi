import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/widgets/favorites_loading.dart';

class FavButton extends StatelessWidget {
  const FavButton({
    super.key,
    required this.isFav,
    this.onTap,
    this.padding,
    this.isLoading = false,
  });
  final bool isFav;
  final void Function()? onTap;
  final double? padding;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.only(
          top: padding == null ? 6 : padding! + 1,
          bottom: padding ?? 5,
          right: padding ?? 5,
          left: padding ?? 5,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightBlue900.withValues(alpha: .6),
          shape: BoxShape.circle,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isLoading
              ? const FavoritesLoading(
                  key: ValueKey('loading'),
                )
              : Icon(
                  key: ValueKey(isFav),
                  isFav ? Icons.favorite : Icons.favorite_outline,
                  color: isFav ? Colors.red : context.textColor,
                ),
        ),
      ),
    );
  }
}
