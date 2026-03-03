import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/shared/functions/calculate_discount_percent.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/brand_section.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/product_description.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/product_rating.dart';

class ProdouctDataSection extends StatelessWidget {
  const ProdouctDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    final product = GoRouterState.of(context).extra as ProductEntity;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.p, vertical: 14),
      decoration: BoxDecoration(
        color: context.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightBlue700.withValues(alpha: .5),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            product.title,
            style: AppTextStyles.enM16.copyWith(
              color: context.textColor,
            ),
          ),

          6.verticalSizedBox,

          // rating
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.withValues(alpha: .05),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),

                4.horizontalSizedBox,

                Text(
                  "${product.avgRating}",
                  style: AppTextStyles.enSb14.copyWith(
                    color: context.textColor,
                  ),
                ),

                6.horizontalSizedBox,

                Text(
                  "(${product.ratingCount} ${context.l10n.rating})",
                  style: AppTextStyles.normalTextStyle.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          8.verticalSizedBox,

          // Price & Discount
          Text.rich(
            TextSpan(
              text: product.priceAfterDiscount != null
                  ? "${product.priceAfterDiscount} LE "
                  : "${product.price} LE ",
              style: AppTextStyles.enSb18.copyWith(
                color: context.textColor,
              ),
              children: [
                if (product.priceAfterDiscount != null) ...[
                  TextSpan(
                    text: "${product.price}",
                    style: AppTextStyles.enM16.copyWith(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  TextSpan(
                    text:
                        " ${calculateDiscountPercent(product.price, product.priceAfterDiscount!)}% OFF",
                    style: AppTextStyles.enSb16.copyWith(
                      color: Colors.green,
                    ),
                  ),
                ],
              ],
            ),
          ),

          8.verticalSizedBox,

          //Desc
          ProductDescription(product: product),

          16.verticalSizedBox,

          // Brand Data
          BrandSection(product: product),

          16.verticalSizedBox,

          //Rating
          ProductRating(product: product),
        ],
      ),
    );
  }
}
