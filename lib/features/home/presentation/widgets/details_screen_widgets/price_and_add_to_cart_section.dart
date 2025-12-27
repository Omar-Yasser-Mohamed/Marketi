import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_add_button.dart';
import 'package:marketi/core/widgets/custom_loading_indicator.dart';
import 'package:marketi/core/widgets/edit_count_buttons.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class PriceAndAddToCartSection extends StatelessWidget {
  const PriceAndAddToCartSection({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
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
        return Container(
          padding: const EdgeInsets.only(
            top: 8,
            right: 14,
            left: 14,
            bottom: 24,
          ),
          decoration: const BoxDecoration(
            color: Color(0xffF5FBFF),
            border: Border(
              top: BorderSide(color: ColorStyles.lightBlue700),
            ),
          ),
          child: Row(
            children: [
              const Text(
                'Price\n345.00 EGP',
                textAlign: TextAlign.center,
                style: TextStyles.enM18,
              ),
              const SizedBox(width: 8),

              Expanded(
                child: isInCart
                    ? AbsorbPointer(
                        absorbing: state is CartEditingLoading,
                        child: EditCountButtons(
                          width: 52,
                          height: 52,
                          countOfProduct: countOfProduct,
                          cartCubit: cartCubit,
                          product: product,
                          isThisItemLoading: isThisItemLoading,
                        ),
                      )
                    : AbsorbPointer(
                        absorbing: state is CartEditingLoading,
                        child: CustomAddButton(
                          height: 52,
                          radius: 14,
                          onPressed: () {
                            cartCubit.addToCart(
                              productId: product.id,
                            );
                          },
                          child: isThisItemLoading
                              ? const CustomLoadingIndicator()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.shopping_cart_outlined,
                                      size: 24,
                                      color: ColorStyles.primary,
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      'Add to cart',
                                      style: TextStyles.enM14.copyWith(
                                        color: ColorStyles.primary,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
