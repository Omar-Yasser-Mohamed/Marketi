import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';
import 'package:marketi/features/orders/presentation/widgets/all_orders_widgets/order_status_badge.dart';

class OrderProcessWidget extends StatelessWidget {
  const OrderProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final order = GoRouterState.of(context).extra as OrderEntity;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Icon(
                Icons.local_shipping,
                color: AppColors.darkBlue700,
              ),
            ),
          ),

          12.horizontalSizedBox,

          Expanded(
            child: Text(
              context.l10n.orderTracking,
              style: AppTextStyles.enSb16,
            ),
          ),

          if (order.isDelivered)
            OrderStatusBadge(
              status: context.l10n.delivered,
              color: Colors.green,
            )
          else
            OrderStatusBadge(
              status: context.l10n.pending,
              color: Colors.orange,
            ),
        ],
      ),
    );
  }
}
