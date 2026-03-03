import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';

import 'package:marketi/features/home/domain/entities/product_entity.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final avgRating = product.avgRating.toDouble();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.rating,
            style: AppTextStyles.enSb16,
          ),
          8.verticalSizedBox,
          Row(
            children: [
              Text(
                "${product.avgRating}",
                style: AppTextStyles.enSb18.copyWith(
                  color: context.textColor,
                ),
              ),

              4.horizontalSizedBox,

              ...List.generate(
                avgRating.floor(),
                (_) => const Icon(
                  Icons.star,
                  color: AppColors.customYellow,
                ),
              ),

              if (avgRating % 1 != 0)
                const Icon(
                  Icons.star_half,
                  color: AppColors.customYellow,
                ),

              ...List.generate(
                5 - avgRating.ceil(),
                (_) => const Icon(
                  Icons.star_border,
                  color: AppColors.customYellow,
                ),
              ),
            ],
          ),

          8.verticalSizedBox,
          Text(
            context.l10n.averageRating(product.ratingCount.toInt()),
            style: AppTextStyles.enR12.copyWith(
              color: context.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
