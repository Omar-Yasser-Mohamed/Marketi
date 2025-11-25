import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/product_item.dart';

class BestProductsForYouListView extends StatelessWidget {
  const BestProductsForYouListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.only(left: 14),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const ProductItem(
        showAddButton: true,
        aspectRatio: 1.98 / 2,
      ),
    );
  }
}
