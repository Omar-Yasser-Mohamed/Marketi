import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';
import 'package:marketi/features/orders/presentation/widgets/order_details_widgets/order_cart_item.dart';

class OrderItemsSection extends StatelessWidget {
  const OrderItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final order = GoRouterState.of(context).extra as OrderEntity;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${context.l10n.items} (${order.cartItems.length})",
          style: AppTextStyles.enSb16.copyWith(
            color: context.textColor,
          ),
        ),

        8.verticalSizedBox,

        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: order.cartItems.length,
          itemBuilder: (context, index) {
            final item = order.cartItems[index];
            return OrderCartItem(
              item: item,
            );
          },
        ),
      ],
    );
  }
}
