import 'package:marketi/features/home/presentation/strategies/products_grid_strategy/desktop_grid_strategy.dart';
import 'package:marketi/features/home/presentation/strategies/products_grid_strategy/products_grid_strategy.dart';

import 'mobile_grid_strategy.dart';
import 'tablet_grid_strategy.dart';

class ProductsGridFactory {
  static ProductsGridStrategy getStrategy(double width) {
    if (width < 600) {
      return MobileGridStrategy();
    } else if (width < 1024) {
      return TabletGridStrategy();
    } else {
      return DesktopGridStrategy();
    }
  }
}
