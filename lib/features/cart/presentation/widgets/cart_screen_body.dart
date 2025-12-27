import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_bloc_builder.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key, this.fromDetailsScreen = false});
  final bool fromDetailsScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 56),
        CustomCenterAppBar(
          title: 'Cart',
          showArrowButton: fromDetailsScreen,
          withShadow: true,
        ),
        const Expanded(
          child: CartBlocBuilder(),
        ),
      ],
    );
  }
}
