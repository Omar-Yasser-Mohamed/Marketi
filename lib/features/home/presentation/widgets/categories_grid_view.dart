import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/presentation/strategies/products_grid_strategy/products_grid_factory.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/category_item.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = GoRouterState.of(context).extra as List<CategoryEntity>;
    final strategy = ProductsGridFactory.getStrategy(context.screenWidth);
    return GridView.builder(
      padding: EdgeInsets.only(
        left: 14.p,
        right: 14.p,
        top: 8,
        bottom: 28,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 18,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          category: categories[index],
        );
      },
    );
  }
}
