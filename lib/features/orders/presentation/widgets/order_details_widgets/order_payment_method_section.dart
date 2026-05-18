import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';

class OrderPaymentMethodSection extends StatelessWidget {
  const OrderPaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final order = GoRouterState.of(context).extra as OrderEntity;
    final isCash = order.paymentMethodType == 'cash';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.primary,
              ),

              8.horizontalSizedBox,

              Text(
                context.l10n.paymentMethod,
                style: AppTextStyles.enSb16.copyWith(
                  color: context.textColor,
                ),
              ),
            ],
          ),

          12.verticalSizedBox,

          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.grey.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  isCash ? Icons.payments_outlined : Icons.credit_card_outlined,
                  color: isCash ? Colors.grey : AppColors.primary,
                  size: 28,
                ),
              ),

              12.horizontalSizedBox,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isCash
                          ? context.l10n.cashOnDelivery
                          : context.l10n.onlinePayment,
                      style: AppTextStyles.enSb14.copyWith(
                        color: context.textColor,
                      ),
                    ),

                    4.verticalSizedBox,

                    Text(
                      isCash
                          ? context.l10n.cashOnDeliveryDescription
                          : context.l10n.onlinePaymentDescription,
                      style: AppTextStyles.normalTextStyle.copyWith(
                        color: context.isDarkMode ? Colors.white70 : Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              8.horizontalSizedBox,

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: order.isPaid
                      ? Colors.green.withValues(alpha: 0.1)
                      : Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: order.isPaid
                        ? Colors.green.withValues(alpha: 0.2)
                        : Colors.orange.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      order.isPaid ? Icons.check_circle_rounded : Icons.info_outline_rounded,
                      size: 14,
                      color: order.isPaid ? Colors.green : Colors.orange,
                    ),

                    4.horizontalSizedBox,

                    Text(
                      order.isPaid
                          ? context.l10n.paid
                          : context.l10n.pending,
                      style: AppTextStyles.enSb12.copyWith(
                        color: order.isPaid ? Colors.green : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
