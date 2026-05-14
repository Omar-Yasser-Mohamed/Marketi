import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/arrow_back_button.dart';
import 'package:marketi/core/widgets/fav_button.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/favorites/presentation/cubits/fav_cubit/fav_cubit.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final favCubit = context.read<FavCubit>();
    return Container(
      padding: EdgeInsets.only(left: 14.p, right: 14.p, bottom: 8),
      decoration: BoxDecoration(
        color: context.isLightMode ? Colors.white : AppColors.primaryDark,
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBlue100.withValues(alpha: .04),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const ArrowBackButton(),

          const Spacer(),

          BlocBuilder<FavCubit, FavState>(
            builder: (context, state) {
              final isFav = favCubit.isFav(productId);
              final isLoading =
                  state is FavActionLoading && state.productId == productId;
              return FavButton(
                isFav: isFav,
                isLoading: isLoading,
                padding: 8,
                onTap: () {
                  if (isFav) {
                    favCubit.removeFavProduct(productId);
                  } else {
                    favCubit.addFavProduct(productId);
                  }
                },
              );
            },
          ),

          16.horizontalSizedBox,

          const ShoppingCartSection(),

          4.horizontalSizedBox,
        ],
      ),
    );
  }
}

class ShoppingCartSection extends StatelessWidget {
  const ShoppingCartSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(AppRoutes.cartScreen);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.primary,
            size: 30,
          ),

          Positioned(
            right: -6,
            top: -12,
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final count = context.read<CartCubit>().cart.products.length;
                return Visibility(
                  visible: count > 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '$count',
                      style: AppTextStyles.enSb12.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
