import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/add_to_cart_section.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/product_details_app_bar.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          38.verticalSpace,
          const ProductDetailsAppBar(),

          const Expanded(
            child: ProductDetailsBody(),
          ),

          const AddToCartSection(),
        ],
      ),
    );
  }
}
