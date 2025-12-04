import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/features/home/domain/entites/brand_entity.dart';
import 'package:marketi/features/home/presentation/widgets/categories_and_brands_widgets/brand_item_with_name.dart';

class CustomBrandsGridView extends StatelessWidget {
  const CustomBrandsGridView({
    super.key,
    required this.brands,
  });
  final List<BrandEntity> brands;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Text(
              'All Brands',
              style: TextStyles.enSb22.copyWith(
                color: ColorStyles.darkBlue900,
              ),
            ),
          ),

          GridView.builder(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 24,
              left: 14,
              right: 14,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              childAspectRatio: 2 / 1.6,
            ),
            itemCount: brands.length,
            itemBuilder: (context, index) => BrandItemWithName(
              brand: brands[index],
            ),
          ),
        ],
      ),
    );
  }
}
