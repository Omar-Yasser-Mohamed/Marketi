import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/horizontal_product_item.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class VirticalProductsListView extends StatelessWidget {
  const VirticalProductsListView({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: products.length,
      itemBuilder: (context, index) => HorizontalProductItem(
        product: products[index],
      ),
    );
  }
}
