import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.orderSummary,
          style: AppTextStyles.enSb16.copyWith(
            color: context.textColor,
          ),
        ),

        12.verticalSizedBox,

        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightBlue700.withValues(alpha: .7),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              _buildRow(
                context: context,
                title: context.l10n.subtotalWithItems(3),
                value: '${context.l10n.egp} 100.00',
              ),

              6.verticalSizedBox,

              _buildRow(
                context: context,
                title: context.l10n.deliveryFees,
                value: '${context.l10n.egp} 10.00',
              ),

              6.verticalSizedBox,

              Divider(
                color: AppColors.lightBlue700.withValues(alpha: .7),
                height: 1,
                thickness: 1,
              ),

              6.verticalSizedBox,

              _buildRow(
                context: context,
                title: context.l10n.total,
                value: '${context.l10n.egp} 10.00',
                color: context.textColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow({
    required BuildContext context,
    required String title,
    required String value,
    Color? color,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.enSb14.copyWith(
            color:
                color ?? (context.isDarkMode ? Colors.white : AppColors.navy),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.enSb14.copyWith(
            color:
                color ?? (context.isDarkMode ? Colors.white : AppColors.navy),
          ),
        ),
      ],
    );
  }
}
