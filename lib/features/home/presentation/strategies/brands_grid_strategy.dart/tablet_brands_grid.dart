import 'package:marketi/features/home/presentation/strategies/brands_grid_strategy.dart/brands_grid_strategy.dart';

class TabletBrandsGrid implements BrandsGridStrategy {
  @override
  double getChildAspectRatio() => 1.1;

  @override
  int getCrossAxisCount() => 5;
}
