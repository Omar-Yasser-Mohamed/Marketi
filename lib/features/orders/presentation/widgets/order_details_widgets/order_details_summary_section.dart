import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';

class OrderDetailsSummarySection extends StatelessWidget {
  const OrderDetailsSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    final order = GoRouterState.of(context).extra as OrderEntity;

    final subtotal = order.totalOrderPrice - order.taxPrice - order.shippingPrice;
    final formattedSubtotal = subtotal.toStringAsFixed(2);
    final formattedTax = order.taxPrice.toStringAsFixed(2);
    final formattedShipping = order.shippingPrice > 0
        ? '${context.l10n.egp} ${order.shippingPrice.toStringAsFixed(2)}'
        : context.l10n.free;
    final formattedTotal = order.totalOrderPrice.toStringAsFixed(2);

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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? AppColors.primaryDark
                : const Color(0xffF9FAFC),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.1),
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              _buildRow(
                context: context,
                title: context.l10n.subtotal,
                value: '${context.l10n.egp} $formattedSubtotal',
              ),

              10.verticalSizedBox,

              _buildRow(
                context: context,
                title: context.l10n.shippingFee,
                value: formattedShipping,
                valueColor: order.shippingPrice == 0 ? Colors.green : null,
              ),

              if (order.taxPrice > 0) ...[
                10.verticalSizedBox,

                _buildRow(
                  context: context,
                  title: context.l10n.tax,
                  value: '${context.l10n.egp} $formattedTax',
                ),
              ],

              12.verticalSizedBox,

              Divider(
                color: AppColors.primary.withValues(alpha: 0.1),
                height: 1,
                thickness: 1,
              ),

              12.verticalSizedBox,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.totalAmount,
                    style: AppTextStyles.enSb16.copyWith(
                      color: context.textColor,
                    ),
                  ),

                  Text(
                    '${context.l10n.egp} $formattedTotal',
                    style: AppTextStyles.enSb18.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
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
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.normalTextStyle.copyWith(
            color: context.isDarkMode ? Colors.white70 : Colors.black54,
            fontSize: 14,
          ),
        ),

        Text(
          value,
          style: AppTextStyles.enSb14.copyWith(
            color: valueColor ?? context.textColor,
          ),
        ),
      ],
    );
  }
}
