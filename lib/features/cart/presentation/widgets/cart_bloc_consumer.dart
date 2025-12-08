import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_message.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/widgets/empty_cart.dart';
import 'package:marketi/features/cart/presentation/widgets/products_on_cart_section.dart';

class CartBlocConsumer extends StatefulWidget {
  const CartBlocConsumer({
    super.key,
  });

  @override
  State<CartBlocConsumer> createState() => _CartBlocConsumerState();
}

class _CartBlocConsumerState extends State<CartBlocConsumer> {
  CartEntity? cart;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartSuccess || state is CartEditingLoading) {
          final cart = context.read<CartCubit>().userCart;
          if (cart.products.isEmpty) {
            return const EmptyCart();
          } else {
            return ProductsOnCartSection(
              cart: cart,
            );
          }
        } else if (state is CartFailure) {
          return CustomErrorMessage(text: state.errorMsg);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
