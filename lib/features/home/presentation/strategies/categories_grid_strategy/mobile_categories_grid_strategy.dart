import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/categories_grid_strategy.dart';

class MobileCategoriesGridStrategy implements CategoriesGridStrategy {
  @override
  int getCrossAxisCount() => 3;

  @override
  double getChildAspectRatio() => 0.85;
}
