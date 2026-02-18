import 'package:flutter/widgets.dart';
import 'package:marketi/core/constansts/app_images.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/home/presentation/strategies/categories_grid_strategy/categories_grid_factory.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final strategy = CategoriesGridFactory.getStrategy(context.screenWidth);
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 14.p),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
        childAspectRatio: strategy.getChildAspectRatio(),
      ),
      itemCount: strategy.getCrossAxisCount() * 2,
      itemBuilder: (context, index) {
        return const GategoryItem();
      },
    );
  }
}

class GategoryItem extends StatelessWidget {
  const GategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.lightBlue700.withValues(alpha: .7),
              ),
            ),
            child: Image.asset(
              AppImages.productTest,
              height: constraints.maxHeight * .65,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Pampers",
            style: AppTextStyles.enM16.copyWith(
              color: context.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
