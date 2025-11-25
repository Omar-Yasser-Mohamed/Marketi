import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        childAspectRatio: 1.8 / 2.1,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 2 / 1.84,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorStyles.lightBlue700.withValues(alpha: .7),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Image.asset(
                  AppImages.categoryTest,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text(
            'Pampers',
            style: TextStyles.enM18.copyWith(
              color: ColorStyles.darkBlue900,
            ),
          ),
        ],
      ),
    );
  }
}
