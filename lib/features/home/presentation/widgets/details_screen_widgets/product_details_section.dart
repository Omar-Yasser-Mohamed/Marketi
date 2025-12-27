import 'package:flutter/material.dart';
import 'package:marketi/core/functions/calc_discount_precentage.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF5FBFF),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: const Offset(0, -1),
            color: ColorStyles.lightBlue700.withValues(alpha: .5),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rating & (Discount and price)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              product.priceAfterDiscount != null
                  ? Text.rich(
                      TextSpan(
                        text: 'EGP ',
                        style: TextStyles.enR18,
                        children: [
                          TextSpan(
                            text:
                                '${product.priceAfterDiscount!.toStringAsFixed(2)} ',
                            style: TextStyles.enM18,
                          ),
                          TextSpan(
                            text: product.price.toStringAsFixed(2),
                            style: TextStyles.enR18.copyWith(
                              color: ColorStyles.customGray,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' ${calculateDiscountPercentage(product.price, product.priceAfterDiscount).toInt()}%',
                            style: TextStyles.enM18.copyWith(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      height: 24,
                      width: width * .33,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorStyles.primary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Free Shipping',
                        style: TextStyles.enM14.copyWith(
                          color: ColorStyles.primary,
                        ),
                      ),
                    ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(
                    product.avgRating.floor(),
                    (_) => const Icon(
                      Icons.star,
                      color: ColorStyles.darkBlue900,
                      size: 20,
                    ),
                  ),

                  if (product.avgRating % 1 != 0)
                    const Icon(
                      Icons.star_half,
                      color: ColorStyles.darkBlue900,
                      size: 20,
                    ),

                  ...List.generate(
                    5 - product.avgRating.ceil(),
                    (_) => const Icon(
                      Icons.star_border,
                      color: ColorStyles.darkBlue900,
                      size: 20,
                    ),
                  ),

                  const SizedBox(width: 4),
                  Text(
                    '(${product.avgRating})',
                    style: TextStyles.enM12,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Product title
          Text(
            product.name,
            style: TextStyles.enM18,
          ),

          const SizedBox(height: 8),

          // Product category
          Text(
            product.category.name,
            style: TextStyles.enR16,
          ),

          const SizedBox(height: 4),

          // Description
          Text(
            product.description,
            style: TextStyles.enR12,
          ),

          const SizedBox(height: 16),

          // Product Brand
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ColorStyles.lightBlue700,
              ),
            ),
            child: Row(
              children: [
                // Brand Image
                Container(
                  width: 56,
                  height: 56,
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: ColorStyles.lightBlue700,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    child: CustomNetworkImage(
                      imageUrl: product.brand.image,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Brand Name
                Expanded(
                  child: Text.rich(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      text: 'Sold by ',
                      style: TextStyles.enR16,
                      children: [
                        TextSpan(
                          text: product.brand.name,
                          style: TextStyles.enM16.copyWith(
                            color: ColorStyles.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorStyles.darkBlue900,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
