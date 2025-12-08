import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/products_screens_widgets/popular_products_screen_body.dart';

class PopularProductsScreen extends StatelessWidget {
  const PopularProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PopularProductsScreenBody(),
    );
  }
}
