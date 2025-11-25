import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/product_item.dart';

class PopularProductsListView extends StatelessWidget {
  const PopularProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.only(left: 14),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const ProductItem(),
    );
  }
}