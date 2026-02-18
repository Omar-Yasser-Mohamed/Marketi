import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.isFav, this.onTap});
  final bool isFav;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 6,
          bottom: 5,
          right: 5,
          left: 5,
        ),
        decoration: BoxDecoration(
          color: AppColors.lightBlue900.withValues(alpha: .6),
          shape: BoxShape.circle,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Icon(
            key: ValueKey(isFav),
            isFav ? Icons.favorite : Icons.favorite_outline,
            color: isFav ? Colors.red : context.textColor,
          ),
        ),
      ),
    );
  }
}
