import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/widgets/product_details_widgets/reviews_list_view.dart';

class ProductReviewsSection extends StatelessWidget {
  final ProductEntity product;
  const ProductReviewsSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${context.l10n.reviews} (${product.reviews.length})",
          style: AppTextStyles.enSb16.copyWith(
            color: context.textColor,
          ),
        ),

        10.verticalSizedBox,

        product.reviews.isEmpty
            ? Text(
                context.l10n.noReviews,
                style: AppTextStyles.enSb14.copyWith(
                  color: context.textColor,
                ),
              )
            : ReviewsListView(reviews: product.reviews),
      ],
    );
  }
}
