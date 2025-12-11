import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/functions/calc_discount_precentage.dart';
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

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.showAddButton = false,
    this.aspectRatio = 4 / 3.3,
    required this.product,
    this.margin = const EdgeInsets.only(right: 16),
  });
  final ProductEntity product;
  final bool showAddButton;
  final double aspectRatio;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final favCubit = context.read<FavoritesCubit>();

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: BlocBuilder<CartCubit, CartState>(
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
              GoRouter.of(context).push(Routes.productDetailsScreen);
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: margin,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: ColorStyles.lightBlue700.withValues(alpha: .7),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        // color: ColorStyles.lightBlue900,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Stack(
                        clipBehavior: Clip.hardEdge,
                        children: [
                          // Image
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CustomNetworkImage(
                                imageUrl: product.image,
                              ),
                            ),
                          ),

                          // Discount
                          product.priceAfterDiscount == null
                              ? const SizedBox()
                              : ClipPath(
                                  clipper: _RightCutClipper(),
                                  child: Container(
                                    height: 24,
                                    width: 82,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xffB2CCFF,
                                      ).withValues(alpha: .4),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${calculateDiscountPercentage(product.price, product.priceAfterDiscount).toStringAsFixed(0)}% OFF',
                                        style: TextStyles.enM14.copyWith(
                                          color: ColorStyles.primary,
                                        ),
                                      ),
                                    ),
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
                              return Positioned(
                                right: 4,
                                top: 4,
                                child: InkWell(
                                  onTap: () {
                                    favCubit.toggleFavorite(
                                      productId: product.id,
                                      isCurrentlyFavorite: isInFavorites,
                                    );
                                  },
                                  child: AbsorbPointer(
                                    absorbing: state is FavoritesToggleLoading,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 3,
                                        bottom: 2,
                                        right: 2,
                                        left: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white,
                                      ),
                                      child: isFavLoading
                                          ? const CustomLoadingIndicator()
                                          : SizedBox(
                                              height: 20,
                                              child: Icon(
                                                isInFavorites
                                                    ? Icons.favorite_rounded
                                                    : Icons
                                                          .favorite_border_rounded,
                                                color: ColorStyles.darkBlue900,
                                              ),
                                            ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const SizedBox(width: 4),
                      Text(
                        product.priceAfterDiscount == null
                            ? '${product.price.toStringAsFixed(2)} LE'
                            : '${product.priceAfterDiscount!.toStringAsFixed(2)} LE',
                        style: TextStyles.enM14.copyWith(
                          color: ColorStyles.darkBlue900,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star_border_rounded,
                        color: ColorStyles.darkBlue900,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${product.avgRating}',
                        style: TextStyles.enM14.copyWith(
                          color: ColorStyles.darkBlue900,
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      product.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.enM14.copyWith(
                        color: ColorStyles.darkBlue900,
                      ),
                    ),
                  ),

                  const SizedBox(height: 4),
                  // Add buttton
                  showAddButton
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: isInCart
                              ? AbsorbPointer(
                                  absorbing: state is CartEditingLoading,
                                  child: EditCountButtons(
                                    height: 28,
                                    countOfProduct: countOfProduct,
                                    cartCubit: cartCubit,
                                    product: product,
                                    isThisItemLoading: isThisItemLoading,
                                  ),
                                )
                              : AbsorbPointer(
                                  absorbing: state is CartEditingLoading,
                                  child: CustomAddButton(
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
                        )
                      : const SizedBox(),
                  const SizedBox(height: 2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RightCutClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0); // شمال فوق
    path.lineTo(size.width, 0); // يمين فوق
    path.lineTo(size.width - 12, size.height); // نزول لتحت شمال شوية
    path.lineTo(0, size.height); // شمال تحت
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
