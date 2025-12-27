import 'package:flutter/material.dart';
import 'package:marketi/features/cart/presentation/widgets/cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.fromDetailsScreen = false});
  final bool fromDetailsScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartScreenBody(
        fromDetailsScreen: fromDetailsScreen,
      ),
    );
  }
}
