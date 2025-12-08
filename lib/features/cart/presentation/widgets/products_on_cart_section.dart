import 'package:flutter/material.dart';
import 'package:marketi/features/cart/domain/entities/cart_entity.dart';
import 'package:marketi/features/cart/presentation/widgets/checkout_section.dart';
import 'package:marketi/features/cart/presentation/widgets/products_on_cart_list_view.dart';

class ProductsOnCartSection extends StatelessWidget {
  const ProductsOnCartSection({super.key, required this.cart});
  final CartEntity cart;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ProductsOnCartListView(
            products: cart.products,
          ),
        ),
        CheckoutSection(
          numberOfItem: cart.products.length,
          totalPrice: cart.totalPrice,
        ),
      ],
    );
  }
}
