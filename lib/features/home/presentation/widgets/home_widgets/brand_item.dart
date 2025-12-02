import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key, required this.brand,
  });
  final BrandEntity brand;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 2 / 1.68,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorStyles.lightBlue700.withValues(alpha: .7),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: CustomNetworkImage(imageUrl: brand.image),
          ),
        ),
      ),
    );
  }
}
