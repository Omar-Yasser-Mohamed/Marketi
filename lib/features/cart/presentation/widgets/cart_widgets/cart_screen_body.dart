import 'package:flutter/material.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_widgets/cart_check_out_section.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_widgets/cart_items_list_view.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key, required this.cart});
  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CartItemsListView(cart: cart)),
        CartCheckOutSection(cart: cart),
      ],
    );
  }
}
