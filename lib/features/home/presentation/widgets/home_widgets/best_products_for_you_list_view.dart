import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/product_item.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class BestProductsForYouListView extends StatelessWidget {
  const BestProductsForYouListView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.only(left: 14),
      scrollDirection: Axis.horizontal,
      itemCount: products.length > 10 ? 10 : products.length ,
      itemBuilder: (context, index) => ProductItem(
        showAddButton: true,
        aspectRatio: 1.98 / 2,
        product: products[index],
      ),
    );
  }
}
