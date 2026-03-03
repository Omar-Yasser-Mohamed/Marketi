import 'package:marketi/features/home/presentation/strategies/products_grid_strategy/products_grid_strategy.dart';

class DesktopGridStrategy implements ProductsGridStrategy {
  @override
  double getChildAspectRatio() => 1.1;

  @override
  int getCrossAxisCount() => 7;
}
