import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/features/profile/presentation/widgets/edit_profile_widgets/update_profile_section.dart';

class EditSection extends StatelessWidget {
  const EditSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.isLightMode
            ? Colors.grey.shade100
            : AppColors.customBlack2,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const UpdateProfileSection(),
    );
  }
}
