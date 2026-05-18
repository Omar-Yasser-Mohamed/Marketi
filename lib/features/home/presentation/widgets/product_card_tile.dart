import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/add_to_cart_button.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/core/widgets/favorites_loading.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_widgets/product_quantity_buttons.dart';
import 'package:marketi/features/favorites/presentation/cubits/fav_cubit/fav_cubit.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

class ProductCardTile extends StatelessWidget {
  const ProductCardTile({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final favCubit = context.read<FavCubit>();

    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutes.productDetailsScreen,
          extra: product.id,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xffDCDDE0)),
          ),
        ),
        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: product.imageCover,
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
                          product.title,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.enM14.copyWith(
                            color: context.textColor,
                          ),
                        ),
                      ),

                      8.horizontalSizedBox,

                      BlocBuilder<FavCubit, FavState>(
                        builder: (context, state) {
                          final isFav = favCubit.isFav(product.id);
                          final isLoading =
                              state is FavActionLoading &&
                              state.productId == product.id;
                          return GestureDetector(
                            onTap: isLoading
                                ? null
                                : () {
                                    if (isFav) {
                                      favCubit.removeFavProduct(product.id);
                                    } else {
                                      favCubit.addFavProduct(product.id);
                                    }
                                  },
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: isLoading
                                  ? const FavoritesLoading(
                                      key: ValueKey("loading"),
                                    )
                                  : Icon(
                                      key: ValueKey(isFav),
                                      isFav
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: isFav
                                          ? Colors.red
                                          : context.textColor,
                                    ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  Text(
                    product.brand.name,
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
                        "${product.avgRating}",
                        style: AppTextStyles.enM12.copyWith(
                          color: context.textColor,
                        ),
                      ),
                    ],
                  ),

                  8.verticalSizedBox,

                  AnimatedSwitcher(
                    switchInCurve: Curves.easeInOut,
                    switchOutCurve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 300),
                    child: BlocBuilder<CartCubit, CartState>(
                      key: const ValueKey("cartItem"),
                      builder: (context, state) {
                        final cartItem = context
                            .read<CartCubit>()
                            .cart
                            .products
                            .where(
                              (element) => element.product.id == product.id,
                            )
                            .firstOrNull;

                        if (cartItem != null) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            child: ProductQuantityButtons(
                              product: cartItem,
                              // iconSize: 24,
                              // padding: 10,
                              // textPadding: 8,
                            ),
                          );
                        }

                        return AddToCartButton(
                          height: 36,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
