import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/all_products_screen_body.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AllProductsScreenBody(),
    );
  }
}