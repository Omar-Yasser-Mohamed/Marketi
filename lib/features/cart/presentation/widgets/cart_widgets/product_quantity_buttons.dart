import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/constansts/app_icons.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';

class ProductQuantityButtons extends StatelessWidget {
  const ProductQuantityButtons({
    super.key,
    required this.product,
    this.iconSize = 18,
    this.padding = 12,
    this.textPadding = 10,
  });
  final CartItemEntity product;
  final double iconSize;
  final double padding;
  final double textPadding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final isLoading =
            state is CartActionLoading && state.productId == product.product.id;
        return Row(
          children: [
            if (product.count > 1)
              _buildCounterButton(
                context: context,
                svgIcon: AppIcons.minus,
                isLoading: isLoading,
                onTap: () {
                  context.read<CartCubit>().updateProductFromCart(
                    product.product.id,
                    product.count - 1,
                  );
                },
                padding: padding,
                iconSize: iconSize,
              ),
            if (product.count == 1)
              _buildCounterButton(
                context: context,
                svgIcon: AppIcons.trush,
                isLoading: isLoading,
                onTap: () {
                  context.read<CartCubit>().removeProductFromCart(
                    product.product.id,
                  );
                },
                padding: padding,
                iconSize: iconSize,
              ),
            8.horizontalSizedBox,

            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(textPadding),
                decoration: BoxDecoration(
                  color: const Color(0xffF5FBFF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      )
                    : Text(
                        "${product.count}",
                        style: AppTextStyles.enSb14.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
              ),
            ),

            8.horizontalSizedBox,

            _buildCounterButton(
              context: context,
              svgIcon: AppIcons.plus,
              isLoading: isLoading,
              onTap: () {
                context.read<CartCubit>().updateProductFromCart(
                  product.product.id,
                  product.count + 1,
                );
              },
              padding: padding,
              iconSize: iconSize,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCounterButton({
    required BuildContext context,
    required String svgIcon,
    required void Function()? onTap,
    bool isLoading = false,
    double iconSize = 18,
    double padding = 12,
  }) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: AppColors.lightBlue900,
          borderRadius: BorderRadius.circular(14),
        ),
        child: SvgPicture.asset(
          svgIcon,
          height: iconSize,
          width: iconSize,
        ),
      ),
    );
  }
}
