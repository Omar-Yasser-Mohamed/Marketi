import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class ProfileDataHeader extends StatelessWidget {
  const ProfileDataHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.isLightMode
            ? Colors.grey.shade100
            : AppColors.customBlack2,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Text(
              "O",
              style: AppTextStyles.enM18.copyWith(color: Colors.black),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.ahlan("Omar"),
                  style: AppTextStyles.enM16.copyWith(
                    color: context.textColor,
                  ),
                ),
                Text(
                  "omary4576@gmail.com",
                  style: AppTextStyles.normalTextStyle.copyWith(
                    color: context.textColor,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.arrow_forward_ios_rounded,
            color: context.textColor,
          ),
        ],
      ),
    );
  }
}
