import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/features/profile/presentation/widgets/profile_widgets/profile_section_tile.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ProfileSectionTile(
        icon: Icons.power_settings_new_rounded,
        title: context.l10n.logout,
        color: Colors.red,
      ),
    );
  }
}
