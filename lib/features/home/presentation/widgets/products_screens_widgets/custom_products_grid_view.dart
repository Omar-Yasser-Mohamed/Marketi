import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/product_item.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class CustomProductsGridView extends StatelessWidget {
  const CustomProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            child: Text(
              'All Products',
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
              mainAxisSpacing: 16,
              childAspectRatio: 1.98 / 2.1,
            ),
            itemCount: 20,
            itemBuilder: (context, index) => ProductItem(
              aspectRatio: 1.98 / 2,
              showAddButton: true,
              margin: EdgeInsets.zero,
              product: ProductEntity(
                id: '0',
                name: 'name',
                image: 'image',
                images: [],
                description: 'description',
                quantity: 10,
                price: 100,
                ratingCount: 4,
                avgRating: 3,
                brand: 'brand',
                category: 'category',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
