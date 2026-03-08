import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/widgets/custom_divider.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_widgets/profile_section_tile.dart';

class ProfileSettingsSection extends StatelessWidget {
  const ProfileSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: context.isLightMode
            ? Colors.grey.shade100
            : AppColors.customBlack2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ProfileSectionTile(
            icon: Icons.payment_outlined,
            title: context.l10n.payment,
          ),

          const CustomDivider(),

          ProfileSectionTile(
            icon: Icons.shopping_bag_outlined,
            title: context.l10n.orders,
          ),

          const CustomDivider(),

          ProfileSectionTile(
            icon: Icons.language_rounded,
            title: context.l10n.language,
          ),

          const CustomDivider(),

          ProfileSectionTile(
            icon: Icons.favorite_border_rounded,
            title: context.l10n.wishlist,
          ),

          const CustomDivider(),

          ProfileSectionTile(
            icon: context.isLightMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            title: context.isLightMode
                ? context.l10n.darkMode
                : context.l10n.lightMode,
          ),
        ],
      ),
    );
  }
}
