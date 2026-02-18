import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.p),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.enSb20.copyWith(
              color: context.textColor,
            ),
          ),

          Text(
            context.l10n.view_all,
            style: AppTextStyles.enM16.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
