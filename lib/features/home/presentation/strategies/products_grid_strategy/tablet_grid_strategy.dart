import 'package:marketi/features/home/presentation/strategies/products_grid_strategy/products_grid_strategy.dart';

class TabletGridStrategy implements ProductsGridStrategy {
  @override
  double getChildAspectRatio() => .85;

  @override
  int getCrossAxisCount() => 4;
}
