import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/product_item.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class FavoritesGirdView extends StatelessWidget {
  const FavoritesGirdView({
    super.key, required this.favProducts,
  });

  final List<ProductEntity> favProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 24,
        left: 14,
        right: 14,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 16,
        childAspectRatio: 1.98 / 2.1,
      ),
      itemCount: favProducts.length,
      itemBuilder: (context, index) => ProductItem(
        aspectRatio: 1.98 / 2,
        showAddButton: true,
        margin: EdgeInsets.zero,
        product: favProducts[index],
      ),
    );
  }
}
