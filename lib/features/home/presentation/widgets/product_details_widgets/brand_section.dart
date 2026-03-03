import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/products_from_same_brand_list_view.dart';

class BrandSection extends StatelessWidget {
  const BrandSection({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              //Brand Image
              Container(
                width: 50.h,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: .5),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: CustomNetworkImage(imageUrl: product.brand.image),
              ),

              16.horizontalSizedBox,

              // Brand Name
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: context.l10n.soldBy,
                    style: AppTextStyles.enR16.copyWith(
                      color: context.textColor,
                    ),
                    children: [
                      TextSpan(
                        text: " ${product.brand.name}",
                        style: AppTextStyles.enSb16.copyWith(
                          color: context.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              4.horizontalSizedBox,

              Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.textColor,
                size: 18,
              ),
            ],
          ),

          16.verticalSizedBox,

          // Products from this brand
          SizedBox(
            height: 200.h,
            child: const ProductsFromSameBrandListView(),
          ),
        ],
      ),
    );
  }
}
