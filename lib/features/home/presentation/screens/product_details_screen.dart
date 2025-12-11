import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/custom_center_app_bar.dart';
import 'package:marketi/features/home/presentation/widgets/details_screen_widgets/price_and_checkout_section.dart';
import 'package:marketi/features/home/presentation/widgets/details_screen_widgets/product_details_section.dart';
import 'package:marketi/features/home/presentation/widgets/details_screen_widgets/product_images_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 58),
          const CustomCenterAppBar(
            title: 'Details',
            withShadow: true,
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: height * .5,
                  child: const ProductImagesSection(),
                ),

                const SizedBox(height: 39),

                const Expanded(
                  child: ProductDetailsSection(),
                ),
              ],
            ),
          ),

          const PriceAndCheckoutSection(),
        ],
      ),
    );
  }
}
