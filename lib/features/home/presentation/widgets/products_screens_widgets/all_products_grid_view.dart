import 'package:flutter/material.dart';
import 'package:marketi/core/theme/color_styles.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/product_item.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';

class AllProductsGridView extends StatelessWidget {
  const AllProductsGridView({super.key, required this.products});
  final List<ProductEntity> products;

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
            itemCount: products.length,
            itemBuilder: (context, index) => ProductItem(
              aspectRatio: 1.98 / 2,
              showAddButton: true,
              margin: EdgeInsets.zero,
              product: products[index],
            ),
          ),
        ],
      ),
    );
  }
}
