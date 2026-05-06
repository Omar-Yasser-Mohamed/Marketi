import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/favorites/presentation/widgets/fav_states_bloc_builder.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.favorites,
          style: AppTextStyles.enSb20,
        ),
        backgroundColor: context.backgroundColor,
        elevation: 4,
        scrolledUnderElevation: 4,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.primary.withValues(alpha: 0.04),
      ),
      body: const FavStatesBlocBuilder(),
    );
  }
}
