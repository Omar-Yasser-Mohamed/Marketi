import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/widgets/product_item.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

class PopularProductsListView extends StatelessWidget {
  const PopularProductsListView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 14.p),
      clipBehavior: Clip.none,
      itemCount: products.length < 10 ? products.length : 10,
      itemBuilder: (context, index) {
        return ProductItem(
          showAddToCartButton: false,
          product: products[index],
        );
      },
    );
  }
}
