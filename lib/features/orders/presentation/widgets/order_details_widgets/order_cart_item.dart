import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';

class OrderCartItem extends StatelessWidget {
  const OrderCartItem({super.key, required this.item});
  final CartItemEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: item.product.imageCover,
            height: 80,
            width: 80,
          ),

          12.horizontalSizedBox,

          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.product.brand.name,
                        style: AppTextStyles.enSb14.copyWith(
                          color: context.textColor,
                        ),
                      ),
                    ),

                    buildItemCount(context),
                  ],
                ),

                Text(
                  item.product.title,
                  style: AppTextStyles.enM14.copyWith(
                    color: context.textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${context.l10n.egp} ${item.price}",
                  style: AppTextStyles.enSb18.copyWith(
                    color: context.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItemCount(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        "x${item.count}",
        style: AppTextStyles.enSb12.copyWith(color: Colors.grey),
      ),
    );
  }
}
