import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_add_button.dart';
import 'package:marketi/core/widgets/custom_loading_indicator.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/core/widgets/edit_count_buttons.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/favourites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class ProductItemTile extends StatelessWidget {
  const ProductItemTile({
    super.key,
    this.withBorder = false,
    required this.product,
  });

  final bool withBorder;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final favCubit = context.read<FavoritesCubit>();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final CartEntity userCart = cartCubit.userCart;

        final CartItemEntity cartItem = userCart.products.firstWhere(
          (p) => p.product.id == product.id,
          orElse: () => CartItemEntity(
            product: product,
            count: 0,
            price: product.price,
          ),
        );

        final int countOfProduct = cartItem.count.toInt();
        final bool isInCart = countOfProduct > 0;
        final bool isThisItemLoading =
            state is CartEditingLoading && state.productId == product.id;

        return GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(Routes.productDetailsScreen, extra: product);
          },
          child: Container(
            height: height * .18,
            width: double.infinity,
            padding: withBorder
                ? const EdgeInsets.symmetric(horizontal: 14)
                : null,
            margin: withBorder
                ? const EdgeInsets.symmetric(vertical: 8, horizontal: 14)
                : const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: withBorder ? BorderRadius.circular(14) : null,
              border: withBorder
                  ? Border.all(
                      color: ColorStyles.lightBlue700.withValues(alpha: .7),
                    )
                  : const Border(
                      bottom: BorderSide(color: Color(0xffDCDDE0)),
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
                /// Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomNetworkImage(
                    imageUrl: product.image,
                    width: width * .25,
                  ),
                ),

                const SizedBox(width: 8),

                /// Details
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Name & Fav Button
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

                          // Fav Button
                          BlocBuilder<FavoritesCubit, FavoritesState>(
                            builder: (context, state) {
                              final favProducts = favCubit.favProducts;
                              final isInFavorites = favProducts.any(
                                (p) => p.id == product.id,
                              );

                              final isFavLoading =
                                  state is FavoritesToggleLoading &&
                                  state.productId == product.id;
                              return AbsorbPointer(
                                absorbing: state is FavoritesToggleLoading,
                                child: InkWell(
                                  onTap: () {
                                    favCubit.toggleFavorite(
                                      productId: product.id,
                                      isCurrentlyFavorite: isInFavorites,
                                    );
                                  },
                                  child: isFavLoading
                                      ? const CustomLoadingIndicator()
                                      : SizedBox(
                                          height: 20,
                                          child: Icon(
                                            isInFavorites
                                                ? Icons.favorite_rounded
                                                : Icons.favorite_border_rounded,
                                            color: ColorStyles.darkBlue900,
                                          ),
                                        ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      /// Brand
                      Text(
                        product.brand.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.enM14.copyWith(
                          color: const Color(0xff67687E),
                        ),
                      ),

                      const SizedBox(height: 4),

                      /// Price & Rate
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

                      /// Buttons
                      isInCart
                          ? AbsorbPointer(
                              absorbing: state is CartEditingLoading,
                              child: EditCountButtons(
                                countOfProduct: countOfProduct,
                                cartCubit: cartCubit,
                                product: product,
                                isThisItemLoading: isThisItemLoading,
                              ),
                            )
                          : AbsorbPointer(
                              absorbing: state is CartEditingLoading,
                              child: CustomAddButton(
                                height: 38,
                                radius: 14,
                                onPressed: () {
                                  cartCubit.addToCart(
                                    productId: product.id,
                                  );
                                },
                                child: isThisItemLoading
                                    ? const CustomLoadingIndicator()
                                    : Text(
                                        'Add',
                                        style: TextStyles.enM14.copyWith(
                                          color: ColorStyles.primary,
                                        ),
                                      ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
