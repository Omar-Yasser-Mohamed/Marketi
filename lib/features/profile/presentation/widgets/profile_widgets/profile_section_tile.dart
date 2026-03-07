import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class ProfileSectionTile extends StatelessWidget {
  const ProfileSectionTile({
    super.key,
    required this.icon,
    required this.title,
    this.color,
  });
  final IconData icon;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Icon(
            icon,
            color: color ?? context.textColor,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: AppTextStyles.enM16.copyWith(
                color: color ?? context.textColor,
              ),
            ),
          ),

          const SizedBox(width: 6),

          CustomArrow(color: color),
        ],
      ),
    );
  }
}

class CustomArrow extends StatelessWidget {
  const CustomArrow({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 9, top: 6, bottom: 6, right: 8),
      decoration: BoxDecoration(
        color: color?.withValues(alpha: 0.1) ?? const Color(0xffF5FBFF),
        shape: BoxShape.circle,
        border: Border.all(
          color:
              color?.withValues(alpha: 0.5) ??
              const Color(0xffB2CCFF).withValues(alpha: .7),
        ),
      ),
      child: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: color ?? context.textColor,
      ),
    );
  }
}
