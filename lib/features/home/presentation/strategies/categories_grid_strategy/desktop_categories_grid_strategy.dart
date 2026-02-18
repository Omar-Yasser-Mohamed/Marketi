import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/categories_grid_strategy.dart';

class DesktopCategoriesGridStrategy implements CategoriesGridStrategy {
  @override
  int getCrossAxisCount() => 7;

  @override
  double getChildAspectRatio() => .9;
}
