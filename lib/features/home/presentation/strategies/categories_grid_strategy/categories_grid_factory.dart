import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/categories_grid_strategy.dart';
import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/desktop_categories_grid_strategy.dart';
import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/mobile_categories_grid_strategy.dart';
import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/tablet_categories_grid_strategy.dart';

class CategoriesGridFactory {
  static CategoriesGridStrategy getStrategy(double width) {
    if (width < 600) {
      return MobileCategoriesGridStrategy();
    } else if (width < 1024) {
      return TabletCategoriesGridStrategy();
    } else {
      return DesktopCategoriesGridStrategy();
    }
  }
}
