import 'package:flutter/widgets.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/home/domain/entities/brand_entity.dart';
import 'package:marketi/features/home/presentation/strategies/brands_grid_strategy.dart/brands_grid_factory.dart';
import 'package:marketi/features/home/presentation/widgets/home_widgets/home_brand_item.dart';

class HomeBrandsGridView extends StatelessWidget {
  const HomeBrandsGridView({super.key, required this.brands});
  final List<BrandEntity> brands;

  @override
  Widget build(BuildContext context) {
    final strategy = BrandsGridFactory.getStrategy(context.screenWidth);
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 14.p),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 16,
        childAspectRatio: strategy.getChildAspectRatio(),
      ),
      itemCount: strategy.getCrossAxisCount(),
      itemBuilder: (context, index) {
        return HomeBrandItem(brand: brands[index]);
      },
    );
  }
}

