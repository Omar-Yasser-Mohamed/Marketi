import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/errors/failure_ui_mapper.dart';
import 'package:marketi/core/widgets/custom_failure_widget.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_widgets/cart_screen_body.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_widgets/empty_cart_screen.dart';

class CartItemsBlocBuilder extends StatelessWidget {
  const CartItemsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CartFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return CustomFailureWidget(error: error);
        }
        if (state is CartSuccess || state is CartActionLoading) {
          final cart = context.read<CartCubit>().cart;
          if (cart.products.isEmpty) {
            return const EmptyCartScreen();
          }
          return CartScreenBody(cart: cart);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
