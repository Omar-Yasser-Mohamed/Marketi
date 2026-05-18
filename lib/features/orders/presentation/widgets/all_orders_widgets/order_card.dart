import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';
import 'package:marketi/features/orders/presentation/widgets/all_orders_widgets/order_status_badge.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.backgroundColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.07),
        ),
      ),
      child: Column(
        children: [
          // Order Number And Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${order.orderNumber}',
                      style: AppTextStyles.enR12,
                    ),
                    Text(
                      DateFormat(
                        "MMM dd, yyyy",
                      ).format(order.createdAt ?? DateTime.now()),
                      style: AppTextStyles.enM12,
                    ),
                  ],
                ),
              ),

              if (order.isPaid)
                OrderStatusBadge(
                  status: context.l10n.paid,
                  color: Colors.green,
                ),

              OrderStatusBadge(
                status: order.isDelivered
                    ? context.l10n.delivered
                    : context.l10n.pending,
                color: order.isDelivered ? Colors.green : Colors.orange,
              ),
            ],
          ),

          16.verticalSizedBox,

          // Products Stack and Titles
          Row(
            children: [
              SizedBox(
                width: order.cartItems.length > 1 ? 110 : 60,
                height: 60,
                child: Stack(
                  children: List.generate(
                    order.cartItems.length > 2 ? 2 : order.cartItems.length,
                    (index) {
                      if (index == 1 && order.cartItems.length > 2) {
                        return Positioned(
                          left: index * 20.0,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: context.isLightMode
                                  ? const Color(0xffF5F5F5)
                                  : AppColors.primaryDark,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                width: 1,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "+${order.cartItems.length - 1}",
                              style: AppTextStyles.enSb14.copyWith(
                                color: context.textColor,
                              ),
                            ),
                          ),
                        );
                      }
                      return Positioned(
                        left: index * 45.0,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              width: 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CustomNetworkImage(
                              imageUrl:
                                  order.cartItems[index].product.imageCover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              12.horizontalSizedBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.cartItems.map((e) => e.product.title).join(", "),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.enM14.copyWith(
                        color: context.textColor,
                      ),
                    ),
                    4.verticalSizedBox,
                    Text(
                      "${order.cartItems.length} ${context.l10n.items}",
                      style: AppTextStyles.enM12.copyWith(
                        color: context.textColor.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          16.verticalSizedBox,

          Divider(
            color: AppColors.primary.withValues(alpha: 0.1),
            thickness: 1,
            height: 1,
          ),

          16.verticalSizedBox,

          // Payment and Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.payment,
                    style: AppTextStyles.enR12.copyWith(
                      color: context.textColor.withValues(alpha: 0.6),
                    ),
                  ),
                  Text(
                    order.paymentMethodType.isNotEmpty
                        ? order.paymentMethodType == "cash"
                              ? context.l10n.cashOnDelivery
                              : context.l10n.onlinePayment
                        : context.l10n.cashOnDelivery,
                    style: AppTextStyles.enM14.copyWith(
                      color: context.textColor,
                    ),
                  ),
                ],
              ),
              Text(
                "${order.totalOrderPrice} ${context.l10n.egp}",
                style: AppTextStyles.enSb16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),

          12.verticalSizedBox,

          // View Details Button
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                context.push(AppRoutes.orderDetailsScreen, extra: order);
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primary.withValues(alpha: 0.05),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.viewDetails,
                    style: AppTextStyles.enM14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  4.horizontalSizedBox,
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
