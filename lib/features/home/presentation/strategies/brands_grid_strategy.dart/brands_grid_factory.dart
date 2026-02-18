import 'package:marketi/features/home/presentation/strategies/brands_grid_strategy.dart/brands_grid_strategy.dart';
import 'package:marketi/features/home/presentation/strategies/brands_grid_strategy.dart/desktop_brands_grid.dart';
import 'package:marketi/features/home/presentation/strategies/brands_grid_strategy.dart/mobile_brands_grid.dart';
import 'package:marketi/features/home/presentation/strategies/brands_grid_strategy.dart/tablet_brands_grid.dart';

class BrandsGridFactory {
  static BrandsGridStrategy getStrategy(double width) {
    if (width < 600) {
      return MobileBrandsGrid();
    } else if (width < 1024) {
      return TabletBrandsGrid();
    } else {
      return DesktopBrandsGrid();
    }
  }
}
