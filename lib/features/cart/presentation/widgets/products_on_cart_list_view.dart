import 'package:flutter/material.dart';
import 'package:marketi/core/theme/text_styles.dart';
import 'package:marketi/core/widgets/horizontal_product_item.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';

class ProductsOnCartListView extends StatelessWidget {
  const ProductsOnCartListView({super.key, required this.products});
  final List<CartItemEntity> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            index == 0
                ? const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          "Products on Cart",
                          style: TextStyles.enSb22,
                        ),
                      ),
                      SizedBox(height: 14),
                    ],
                  )
                : const SizedBox(),
            HorizontalProductItem(
              withBorder: true,
              product: products[index].product,
            ),
          ],
        );
      },
    );
  }
}
