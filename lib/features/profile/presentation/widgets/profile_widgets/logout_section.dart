import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_widgets/profile_section_tile.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.isLightMode
            ? Colors.grey.shade100
            : AppColors.customBlack2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ProfileSectionTile(
        onTap: () => _showLogoutDialog(context),
        icon: Icons.power_settings_new_rounded,
        title: context.l10n.logout,
        color: Colors.red,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.isLightMode
            ? Colors.white
            : AppColors.customBlack2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        title: Text(
          context.l10n.logout,
          style: AppTextStyles.enSb18.copyWith(
            color: context.textColor,
          ),
        ),
        content: Text(
          context.l10n.logoutConfirmation,
          style: AppTextStyles.enM14,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              context.l10n.cancel,
              style: AppTextStyles.enM14.copyWith(
                color: context.textColor,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
              context.read<ProfileCubit>().logout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              context.l10n.logout,
              style: AppTextStyles.enSb14,
            ),
          ),
        ],
      ),
    );
  }
}
