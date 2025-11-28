import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/features/cart/presentation/widgets/empty_cart.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: const [
        SizedBox(height: 14),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: CustomCenterAppBar(
            title: 'Cart',
            showArrowButton: false,
          ),
        ),
        EmptyCart(),
      ],
    );
  }
}
