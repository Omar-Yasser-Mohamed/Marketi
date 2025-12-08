import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/best_products_screen_body.dart';

class BestProductsScreen extends StatelessWidget {
  const BestProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BestProductsScreenBody(),
    );
  }
}
