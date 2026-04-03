import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';
import 'package:marketi/features/cart/presentation/widgets/product_quantity_buttons.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.product});
  final CartItemEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.customBlack2 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBlue700.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomNetworkImage(
            imageUrl: product.product.imageCover,
            height: 100.h,
            width: 100.h,
          ),

          8.horizontalSizedBox,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title & fav icon
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.product.title,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.enM14.copyWith(
                          color: context.textColor,
                        ),
                      ),
                    ),

                    const Icon(
                      Icons.favorite_border_rounded,
                    ),
                  ],
                ),

                Text(
                  product.product.brand.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.enM12.copyWith(
                    color: const Color(0xff67687E),
                  ),
                ),

                8.verticalSizedBox,

                // price & rating
                Row(
                  children: [
                    Text(
                      "${context.l10n.price}: ${product.price} ${context.l10n.egp}",
                      style: AppTextStyles.enM14.copyWith(
                        color: context.textColor,
                      ),
                    ),

                    const Spacer(),

                    Icon(
                      Icons.star_border,
                      color: context.textColor,
                      size: 20,
                    ),

                    2.horizontalSizedBox,

                    Text(
                      "4.5",
                      style: AppTextStyles.enM12.copyWith(
                        color: context.textColor,
                      ),
                    ),
                  ],
                ),

                8.verticalSizedBox,

                ProductQuantityButtons(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
