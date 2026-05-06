import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/widgets/product_item.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/strategies/products_grid_strategy/products_grid_factory.dart';

class FavProductsGridView extends StatelessWidget {
  final List<ProductEntity> products;
  const FavProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final strategy = ProductsGridFactory.getStrategy(context.screenWidth);
    return GridView.builder(
      padding: EdgeInsets.only(
        left: 14.p,
        right: 14.p,
        top: 4,
        bottom: 14,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 18,
        mainAxisSpacing: 14,
        childAspectRatio: strategy.getChildAspectRatio()
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductItem(
          product: products[index],
          marginRight: 0,
        );
      },
    );
  }
}
