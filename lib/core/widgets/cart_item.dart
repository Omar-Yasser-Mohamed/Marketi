import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/routes/routes.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(Routes.cartScreen, extra: true);
      },
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          return SizedBox(
            height: 52,
            width: 52,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 28,
                    color: ColorStyles.primary,
                  ),
                ),

                Positioned(
                  top: 3,
                  right: 3,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: ColorStyles.primary,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        '${cartCubit.userCart.products.length}',
                        style: TextStyles.enSb10.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
