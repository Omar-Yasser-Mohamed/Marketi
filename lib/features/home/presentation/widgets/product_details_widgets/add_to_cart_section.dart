import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/add_to_cart_button.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_widgets/product_quantity_buttons.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final price = product.priceAfterDiscount != null
        ? product.priceAfterDiscount!
        : product.price;
    return Container(
      padding: EdgeInsets.only(
        left: 14.p,
        right: 14.p,
        bottom: MediaQuery.of(context).padding.bottom + 4,
        top: 8,
      ),
      decoration: BoxDecoration(
        color: context.backgroundColor,
        border: Border(
          top: BorderSide(color: AppColors.primary.withValues(alpha: 0.2)),
        ),
      ),
      child: Row(
        children: [
          // price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.price,
                style: AppTextStyles.enM16.copyWith(
                  color: context.textColor,
                ),
              ),
              Text(
                "$price ${context.l10n.egp}",
                style: AppTextStyles.enSb16.copyWith(
                  color: context.textColor,
                ),
              ),
            ],
          ),

          16.horizontalSizedBox,

          // Add to cart button
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
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
                  return ProductQuantityButtons(
                    product: cartItem,
                    iconSize: 22,
                    padding: 14,
                    textPadding: 12,
                  );
                }

                return AddToCartButton(
                  height: 44.h,
                  isLoading:
                      state is CartActionLoading &&
                      state.productId == product.id,
                  onPressed: () {
                    context.read<CartCubit>().addProductToCart(product.id);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: context.logoColor,
                        size: 24,
                      ),
                      4.horizontalSizedBox,
                      Text(
                        context.l10n.addToCart,
                        style: AppTextStyles.enM14.copyWith(
                          color: context.logoColor,
                        ),
                      ),
                    ],
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
