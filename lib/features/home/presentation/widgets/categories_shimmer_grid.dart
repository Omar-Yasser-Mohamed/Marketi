import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/home/presentation/strategies/products_grid_strategy/products_grid_factory.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesShimmerGrid extends StatelessWidget {
  const CategoriesShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final strategy = ProductsGridFactory.getStrategy(context.screenWidth);
    return GridView.builder(
      padding: EdgeInsets.only(
        left: 14.p,
        right: 14.p,
        top: 8,
        bottom: 28,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: strategy.getCrossAxisCount(),
        crossAxisSpacing: 18,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemCount: strategy.getCrossAxisCount() * 4,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 4),

            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 16,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
