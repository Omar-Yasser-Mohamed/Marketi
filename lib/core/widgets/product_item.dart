import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/add_to_cart_button.dart';
import 'package:marketi/core/widgets/discount_banner.dart';
import 'package:marketi/core/widgets/fav_button.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    this.showAddToCartButton = true,
    required this.product,
  });
  final bool showAddToCartButton;
  final ProductEntity product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.productDetailsScreen);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        width: context.screenHeight * .2,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: context.isLightMode ? Colors.white : AppColors.primaryDark,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightBlue700.withValues(alpha: .7),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image, Discount & Fav Button
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.lightBlue900,
                  ),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      widget.product.imageCover,
                      width: double.infinity,
                    ),

                    Positioned(
                      top: 4,
                      right: 4,
                      child: FavButton(
                        isFav: _isFav,
                        onTap: () {
                          setState(() {
                            _isFav = !_isFav;
                          });
                        },
                      ),
                    ),

                    const DiscountBanner(),
                  ],
                ),
              ),
            ),
            4.verticalSizedBox,

            // Price & rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  Text(
                    "${widget.product.price} LE",
                    style: AppTextStyles.enM12.copyWith(
                      color: context.textColor,
                    ),
                  ),
                  const Spacer(),

                  Icon(
                    Icons.star_border_outlined,
                    color: context.textColor,
                  ),

                  2.horizontalSizedBox,

                  Text(
                    "${widget.product.avgRating}",
                    style: AppTextStyles.enM12.copyWith(
                      color: context.textColor,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                widget.product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.enM12.copyWith(
                  color: context.textColor,
                ),
              ),
            ),

            // Add to cart button
            widget.showAddToCartButton
                ? Column(
                    children: [
                      4.verticalSizedBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AddToCartButton(
                          child: Text(
                            context.l10n.add,
                            style: AppTextStyles.enM14.copyWith(
                              color: AppColors.darkBlue100,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),

            2.verticalSizedBox,
          ],
        ),
      ),
    );
  }
}
