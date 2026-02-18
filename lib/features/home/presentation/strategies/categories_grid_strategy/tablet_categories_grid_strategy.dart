import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/categories_grid_strategy.dart';

class TabletCategoriesGridStrategy implements CategoriesGridStrategy {
  @override
  int getCrossAxisCount() => 5;

  @override
  double getChildAspectRatio() => .85;
}
