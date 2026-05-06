import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_colors.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/favorites/presentation/widgets/fav_products_grid_view.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';

class FavScreenBody extends StatelessWidget {
  final List<ProductEntity> products;
  const FavScreenBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        14.verticalSizedBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.p),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${products.length} ",
                  style: AppTextStyles.enSb18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                TextSpan(
                  text: context.l10n.itemsInYourWishList,
                  style: AppTextStyles.enSb18.copyWith(
                    color: context.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        10.verticalSizedBox,

        Expanded(
          child: FavProductsGridView(products: products),
        ),
      ],
    );
  }
}
