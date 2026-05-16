import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/core/widgets/favorites_loading.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_widgets/product_quantity_buttons.dart';
import 'package:marketi/features/favorites/presentation/cubits/fav_cubit/fav_cubit.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.product});
  final CartItemEntity product;

  @override
  Widget build(BuildContext context) {
    final favCubit = context.read<FavCubit>();

    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutes.productDetailsScreen,
          extra: product.product.id,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: context.isDarkMode ? AppColors.customBlack2 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightBlue700.withValues(alpha: 0.5),
              blurRadius: 10,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomNetworkImage(
              imageUrl: product.product.imageCover,
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
                          product.product.title,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.enM14.copyWith(
                            color: context.textColor,
                          ),
                        ),
                      ),

                      8.horizontalSizedBox,

                      BlocBuilder<FavCubit, FavState>(
                        builder: (context, state) {
                          final isFav = favCubit.isFav(product.product.id);
                          final isLoading =
                              state is FavActionLoading &&
                              state.productId == product.product.id;
                          return GestureDetector(
                            onTap: isLoading
                                ? null
                                : () {
                                    if (isFav) {
                                      favCubit.removeFavProduct(
                                        product.product.id,
                                      );
                                    } else {
                                      favCubit.addFavProduct(
                                        product.product.id,
                                      );
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
                    product.product.brand.name,
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
                        "4.5",
                        style: AppTextStyles.enM12.copyWith(
                          color: context.textColor,
                        ),
                      ),
                    ],
                  ),

                  8.verticalSizedBox,

                  ProductQuantityButtons(product: product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
