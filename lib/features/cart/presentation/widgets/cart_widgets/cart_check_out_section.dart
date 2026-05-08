import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/app_button.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';

class CartCheckOutSection extends StatelessWidget {
  const CartCheckOutSection({super.key, required this.cart});
  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16.h),
      decoration: BoxDecoration(
        color: context.backgroundColor,
        border: Border(
          top: BorderSide(
            color: AppColors.lightBlue700.withValues(alpha: 0.7),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBlue700.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        children: [
          // total price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${context.l10n.suptotal} (${cart.products.length} ${context.l10n.items})",
                style: AppTextStyles.enSb14.copyWith(
                  color: context.textColor,
                ),
              ),
              Text(
                "${context.l10n.egp} ${cart.totalCartPrice}",
                style: AppTextStyles.enSb14.copyWith(
                  color: context.textColor,
                ),
              ),
            ],
          ),

          14.verticalSizedBox,

          AppButton(
            text: context.l10n.checkout,
            onPressed: () {
              context.push(AppRoutes.checkoutScreen);
            },
          ),
        ],
      ),
    );
  }
}
