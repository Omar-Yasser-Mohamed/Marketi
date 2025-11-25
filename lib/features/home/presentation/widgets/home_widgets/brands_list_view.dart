import 'package:flutter/material.dart';
import 'package:marketi/core/app_assets/app_images.dart';
import 'package:marketi/core/theme/color_styles.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        
        // Don't forget add Expanded to BrandItem

        BrandItem(),
        BrandItem(),
        BrandItem(),

        SizedBox(width: 12),
      ],
    );
  }
}

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1.68,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 14, right: 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorStyles.lightBlue700.withValues(alpha: .7),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Image.asset(AppImages.brandTest),
        ),
      ),
    );
  }
}
