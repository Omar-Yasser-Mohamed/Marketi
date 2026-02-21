import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/widgets/product_item.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

class HomeProductsListView extends StatelessWidget {
  const HomeProductsListView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 14.p),
      itemCount: products.length < 10 ? products.length : 10,
      itemBuilder: (context, index) {
        return ProductItem(
          product: products[index],
        );
      },
    );
  }
}
