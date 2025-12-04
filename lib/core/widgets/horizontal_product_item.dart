import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_add_button.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class HorizontalProductItem extends StatelessWidget {
  const HorizontalProductItem({
    super.key,
    this.withBorder = false,
    required this.product,
  });
  final bool withBorder;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .18,
      width: double.infinity,
      padding: withBorder ? const EdgeInsets.symmetric(horizontal: 14) : null,
      margin: withBorder
          ? const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 14,
            )
          : const EdgeInsets.symmetric(
              horizontal: 14,
            ),
      decoration: BoxDecoration(
        borderRadius: withBorder ? BorderRadius.circular(14) : null,
        border: withBorder
            ? Border.all(
                color: ColorStyles.lightBlue700.withValues(alpha: .7),
              )
            : const Border(
                bottom: BorderSide(
                  color: Color(0xffDCDDE0),
                ),
              ),
        color: Colors.white,
        boxShadow: withBorder
            ? [
                BoxShadow(
                  color: ColorStyles.lightBlue700.withValues(alpha: .7),
                  blurRadius: 10,
                ),
              ]
            : null,
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomNetworkImage(
              imageUrl: product.image,
              width: width * .25,
            ),
          ),

          const SizedBox(width: 8),

          // Details
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name & Fav Button
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: TextStyles.enM16,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const Icon(
                      Icons.favorite_border_rounded,
                      color: ColorStyles.darkBlue900,
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Brand
                Text(
                  product.brand,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.enM14.copyWith(
                    color: const Color(0xff67687E),
                  ),
                ),

                const SizedBox(height: 4),

                // Price & Rate
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Price: ${product.price.toStringAsFixed(2)} EGP',
                        style: TextStyles.enM16,
                      ),
                    ),

                    const Icon(
                      Icons.star_border_rounded,
                      color: ColorStyles.darkBlue900,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      product.avgRating.toString(),
                      style: TextStyles.enM14,
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Add to cart button
                CustomAddButton(
                  height: 38,
                  radius: 14,
                  onPressed: () {},
                  child: Text(
                    'Add',
                    style: TextStyles.enM14.copyWith(
                      color: ColorStyles.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
