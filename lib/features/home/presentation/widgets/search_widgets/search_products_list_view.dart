import 'package:flutter/material.dart';
import 'package:marketi/core/extentions/context_extentions.dart';
import 'package:marketi/core/extentions/responsive_extentions.dart';
import 'package:marketi/core/extentions/sized_box_extention.dart';
import 'package:marketi/core/styles/app_text_styles.dart';
import 'package:marketi/features/home/domain/entities/product_entity.dart';
import 'package:marketi/features/home/presentation/widgets/product_card_tile.dart';

class SearchProductsListView extends StatelessWidget {
  const SearchProductsListView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        8.verticalSizedBox,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.p),
          child: Text(
            context.l10n.searchResultsCount(products.length),
            style: AppTextStyles.enM16.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        2.verticalSizedBox,

        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: 14.p,
              right: 14.p,
              bottom: MediaQuery.of(context).viewPadding.bottom,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCardTile(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}
