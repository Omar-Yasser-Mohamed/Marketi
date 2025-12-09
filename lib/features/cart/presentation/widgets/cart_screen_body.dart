import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_bloc_builder.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 56),
        CustomCenterAppBar(
          title: 'Cart',
          showArrowButton: false,
          withShadow: true,
        ),
        Expanded(
          child: CartBlocBuilder(),
        ),
      ],
    );
  }
}
