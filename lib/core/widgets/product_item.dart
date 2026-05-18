import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/shared/functions/calculate_discount_percent.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/add_to_cart_button.dart';
import 'package:marketi/core/widgets/discount_banner.dart';
import 'package:marketi/core/widgets/fav_button.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_widgets/product_quantity_buttons.dart';
import 'package:marketi/features/favorites/presentation/cubits/fav_cubit/fav_cubit.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.showAddToCartButton = true,
    required this.product,
    this.marginRight,
  });
  final bool showAddToCartButton;
  final ProductEntity product;
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartCubit>().cart;
    final favCubit = context.read<FavCubit>();

    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutes.productDetailsScreen,
          extra: product.id,
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: marginRight ?? 14),
        width: context.screenHeight * .2,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: context.isLightMode ? Colors.white : AppColors.primaryDark,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightBlue700.withValues(alpha: .3),
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
                    CustomNetworkImage(
                      imageUrl: product.imageCover,
                    ),

                    Positioned(
                      top: 4,
                      right: 4,
                      child: BlocBuilder<FavCubit, FavState>(
                        builder: (context, state) {
                          final isFav = favCubit.isFav(product.id);
                          final isLoading =
                              state is FavActionLoading &&
                              state.productId == product.id;
                          return FavButton(
                            isFav: isFav,
                            isLoading: isLoading,
                            onTap: () {
                              if (isFav) {
                                favCubit.removeFavProduct(product.id);
                              } else {
                                favCubit.addFavProduct(product.id);
                              }
                            },
                          );
                        },
                      ),
                    ),

                    if (product.priceAfterDiscount != null)
                      Positioned(
                        top: 0,
                        left: 0,
                        child: DiscountBanner(
                          discount: calculateDiscountPercent(
                            product.price,
                            product.priceAfterDiscount!,
                          ),
                        ),
                      ),
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
                    product.priceAfterDiscount != null
                        ? "${product.priceAfterDiscount} LE"
                        : "${product.price} LE",
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
                    "${product.avgRating}",
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
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.enM12.copyWith(
                  color: context.textColor,
                ),
              ),
            ),

            // Add to cart button
            showAddToCartButton
                ? Column(
                    children: [
                      6.verticalSizedBox,
                      SizedBox(
                        height: 30.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: BlocBuilder<CartCubit, CartState>(
                            builder: (context, state) {
                              final cartItem = context
                                  .read<CartCubit>()
                                  .cart
                                  .products
                                  .where(
                                    (element) =>
                                        element.product.id == product.id,
                                  )
                                  .firstOrNull;

                              if (cartItem != null) {
                                return ProductQuantityButtons(
                                  product: cartItem,
                                  iconSize: 16,
                                  padding: 10,
                                  textPadding: 6,
                                );
                              }

                              return AddToCartButton(
                                height: 30,
                                isLoading:
                                    state is CartActionLoading &&
                                    state.productId == product.id,
                                child: Text(
                                  context.l10n.add,
                                  style: AppTextStyles.enM14.copyWith(
                                    color: AppColors.darkBlue100,
                                  ),
                                ),
                                onPressed: () {
                                  context.read<CartCubit>().addProductToCart(
                                    product.id,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),

            4.verticalSizedBox,
          ],
        ),
      ),
    );
  }
}
