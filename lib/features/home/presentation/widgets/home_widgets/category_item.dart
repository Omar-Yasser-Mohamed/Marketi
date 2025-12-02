import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/home/domain/entites/category_entity.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    this.aspectRatio = 2 / 1.84,
  });

  final CategoryEntity category;
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
                  imageUrl: category.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Text(
          category.name,
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
