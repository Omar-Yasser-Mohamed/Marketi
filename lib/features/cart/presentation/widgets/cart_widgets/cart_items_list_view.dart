import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_widgets/cart_item_card.dart';

class CartItemsListView extends StatelessWidget {
  const CartItemsListView({super.key, required this.cart});
  final CartEntity cart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.p, vertical: 16),
      itemCount: cart.products.length,
      itemBuilder: (context, index) {
        return CartItemCard(product: cart.products[index]);
      },
    );
  }
}