import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/routing/app_routes.dart';
import 'package:marketi/features/home/domain/entities/category_entity.dart';
import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/categories_grid_factory.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/category_item.dart';

class HomeCategoriesGridView extends StatelessWidget {
  const HomeCategoriesGridView({super.key, required this.categories});
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final strategy = CategoriesGridFactory.getStrategy(context.screenWidth);
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 14.p),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: strategy.getChildAspectRatio(),
      ),
      itemCount: categories.length < strategy.getCrossAxisCount() * 2
          ? categories.length
          : strategy.getCrossAxisCount() * 2,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(
              AppRoutes.categoryProductsScreen,
              extra: categories[index],
            );
          },
          child: CategoryItem(
            category: categories[index],
          ),
        );
      },
    );
  }
}
