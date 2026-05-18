import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';

class OrderShippingAddressSection extends StatelessWidget {
  const OrderShippingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final order = GoRouterState.of(context).extra as OrderEntity;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.local_shipping_outlined,
                color: AppColors.primary,
              ),

              8.horizontalSizedBox,

              Text(
                context.l10n.shippingAddress,
                style: AppTextStyles.enSb16.copyWith(
                  color: context.textColor,
                ),
              ),
            ],
          ),

          12.verticalSizedBox,

          Row(
            crossAxisAlignment: .start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: context.isDarkMode ? Colors.white : Colors.black54,
              ),

              8.horizontalSizedBox,

              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      context.l10n.home,
                      style: AppTextStyles.enSb14.copyWith(
                        color: context.textColor,
                      ),
                    ),

                    Text(
                      order.shippingAddress.city,
                      style: AppTextStyles.normalTextStyle.copyWith(
                        color: context.isDarkMode
                            ? Colors.white
                            : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          12.verticalSizedBox,

          Row(
            crossAxisAlignment: .start,
            children: [
              Icon(
                Icons.phone_outlined,
                color: context.isDarkMode ? Colors.white : Colors.black54,
              ),

              8.horizontalSizedBox,

              Expanded(
                child: Text(
                  order.shippingAddress.phone,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.normalTextStyle.copyWith(
                    color: context.isDarkMode ? Colors.white : Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
