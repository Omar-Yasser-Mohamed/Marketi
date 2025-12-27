import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/features/home/domain/entites/product_entity.dart';
import 'package:marketi/features/home/presentation/widgets/details_screen_widgets/price_and_add_to_cart_section.dart';
import 'package:marketi/features/home/presentation/widgets/details_screen_widgets/product_details_section.dart';
import 'package:marketi/features/home/presentation/widgets/details_screen_widgets/product_images_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 56),
          const CustomCenterAppBar(
            title: 'Product Details',
            withShadow: true,
            showCart: true,
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: height * .5,
                  child: ProductImagesSection(
                    images: product.images.isNotEmpty
                        ? product.images
                        : [product.image],
                  ),
                ),

                const SizedBox(height: 39),

                Expanded(
                  child: ProductDetailsSection(
                    product: product,
                  ),
                ),
              ],
            ),
          ),

          PriceAndAddToCartSection(
            product: product,
          ),
        ],
      ),
    );
  }
}
