import 'package:marketi/features/home/presentation/strategies/brands_grid_strategy.dart/brands_grid_strategy.dart';

class MobileBrandsGrid implements BrandsGridStrategy {
  @override
  double getChildAspectRatio() => 1.1;

  @override
  int getCrossAxisCount() => 3;
}
