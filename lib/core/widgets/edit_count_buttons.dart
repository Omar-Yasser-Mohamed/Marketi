import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_icons.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_icon_button.dart';
import 'package:marketi/core/widgets/custom_loading_indicator.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class EditCountButtons extends StatelessWidget {
  const EditCountButtons({
    super.key,
    required this.countOfProduct,
    required this.cartCubit,
    required this.product,
    required this.isThisItemLoading, this.height = 40,
  });

  final int countOfProduct;
  final CartCubit cartCubit;
  final ProductEntity product;
  final bool isThisItemLoading;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          countOfProduct == 1
              ? CustomIconButton(
                  iconSvg: AppIcons.trash,
                  iconColor: Colors.red,
                  onTap: () {
                    cartCubit.deleteFromCart(
                      productId: product.id,
                    );
                  },
                )
              : CustomIconButton(
                  icon: Icons.remove,
                  onTap: () {
                    cartCubit.removeFromCart(
                      productId: product.id,
                      numberOfItems: countOfProduct - 1,
                    );
                  },
                ),

          const SizedBox(width: 12),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF5FBFF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: isThisItemLoading
                    ? const CustomLoadingIndicator()
                    : Text(
                        '$countOfProduct',
                        style: TextStyles.enSb16.copyWith(
                          color: ColorStyles.primary,
                        ),
                      ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          CustomIconButton(
            icon: Icons.add,
            onTap: () {
              cartCubit.addToCart(
                productId: product.id,
              );
            },
          ),
        ],
      ),
    );
  }
}
