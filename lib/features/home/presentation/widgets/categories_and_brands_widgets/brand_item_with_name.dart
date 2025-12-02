import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';

class BrandItemWithName extends StatelessWidget {
  const BrandItemWithName({
    super.key,
    required this.brand,
    this.aspectRatio = 2 / 1.2,
  });

  final BrandEntity brand;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: aspectRatio,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorStyles.lightBlue700.withValues(alpha: .7),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomNetworkImage(
                  imageUrl: brand.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Text(
          brand.name,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyles.enM18.copyWith(
            color: ColorStyles.darkBlue900,
          ),
        ),
      ],
    );
  }
}
