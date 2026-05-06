import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/add_to_cart_section.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/product_details_app_bar.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/product_details_body.dart';

class ProductDetailsScreenBody extends StatelessWidget {
  const ProductDetailsScreenBody({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        38.verticalSpace,
        ProductDetailsAppBar(productId: product.id),
        Expanded(
          child: ProductDetailsBody(product: product),
        ),
        AddToCartSection(product: product),
      ],
    );
  }
}
